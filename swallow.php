<?php
  $filename=__DIR__.'\suitecrm_developer_book.wiki';
  echo $filename;
  $book = file($filename);
  echo PHP_EOL.count($book).PHP_EOL;
  $count=0;
  $chapters=Array();
  $chapter='';
  foreach ($book as $line) {
	  echo $count.' '.$line.' '.(strstr($line,'id="chap')!=null).PHP_EOL;
	  if (strstr($line,'id="chap')!=null) {
		  $chapters[]=$chapter;
		  $chapter=$line;  // re-start with just this one line
	  }
      $chapter = $chapter.PHP_EOL.$line;
	  $count++;
  	  //if ($count == 145) break;
  }  
  
  foreach ($chapters as $c => $out) {
     file_put_contents(__DIR__.'\chap'.sprintf('%02d', $c).'.html', $chapters[$c]);   //,FILE_APPEND);
  }
?>