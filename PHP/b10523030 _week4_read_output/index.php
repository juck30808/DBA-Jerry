<!DOCTYPE html>

<html>
	<head>
		<title>B10623003</title>
		<meta charset="utf-8"/>		
	</head>
	
	<body>
		<?php
			//$file = "p6_input.dat";
			//$file = $_GET["p6_input.dat"];
			$file = basename($_SERVER["PHP_SELF"],".php");
			//echo $file;
			$path = realpath($file.".php");
			//echo $path;
			$parts = pathinfo($path);
			$readfile = $parts["dirname"]."\\p6_input.dat";
			$writefile = $parts["dirname"] . "\\p6_output.dat";
			//echo $readfile;
			
			//$fin = fopen($readfile, "r");
			//$line = fscanf($fin, "%s %s %s %s");
			if (file_exists($readfile)){
				$lines = file($readfile);
				foreach ($lines as $n => $line){
					//echo $n . " " . $line . "<br/>";
					$lines[$n] = ($n+1) . " " . $lines[$n];
					echo $line . "<br/>";
				}
				echo "<p>　</p>";
				$writefile = fopen($writefile,"w");
				foreach ($lines as $n => $line){
					fprintf($writefile, "%s", $line);
					echo $line . "<br/>";
				}				
				fclose($writefile);
			}						
			
		?>		
	</body>


</html>
