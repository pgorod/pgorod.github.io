<?php
  $filename=__DIR__.'\suitecrm_developer_book.wiki';
  echo $filename;
  $book = file($filename);
  echo PHP_EOL.count($book).PHP_EOL;
  $count=0;
  $chapnum=0;
  $chapters=Array();
  $chapter='';
  foreach ($book as $line) {
	  echo $count.' '.$line.' '.(strstr($line,'id="chap')!=null);
	  if (strstr($line,'id="chap')!=null) {
		  //prepend front-matter:
		  $chapter = '---'
		     .PHP_EOL.'permalink: "/chap'.sprintf('%02d', $chapnum).'.html"'.PHP_EOL.'layout: page'
		     .PHP_EOL.'title: "Chapter '.sprintf('%02d', $chapnum).'"'
			 .PHP_EOL.'---'.PHP_EOL.$chapter;
			 
		  $chapters[]=$chapter;
		  $chapnum=$chapnum+1;
		  $chapter=$line;  // re-start with just this one line
		  continue;
	  }
	  $from = array("====", "===", "==");
      $to = array("####", "###", "##");
	  $pretty=str_replace($from, $to, $line);

      $chapter = $chapter.$pretty;
	  $count++;
  	  //if ($count == 145) break;
  }  
  
  foreach ($chapters as $c => $out) {
     file_put_contents(__DIR__.'\_pages\chap'.sprintf('%02d', $c).'.ml', $chapters[$c]);   //,FILE_APPEND);
  }
?>


