# this script invoke FitP2.py to fit merged correlation functions.
$prefix="merged"
$csvfile="${prefix}.csv"
# python .\FitP4.py $csvfile $prefix --xmax 60 --onesite exp


$reads=@("ERR1094795", "ERR1094797", "ERR1094799", "ERR1094796", "ERR1094798", "ERR1094800", "ERR1094802") # the first three are UDG-treated.
$reads=@("ERR1094802")
ForEach ($read in $reads) {
    $mycsvfile="data/${read}_merged.csv"
    python .\FitP4.py $mycsvfile "data/${read}_merged" --xmax 60 --onesite exp
}

Write-Output "Done"