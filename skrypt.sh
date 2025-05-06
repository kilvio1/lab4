#!/bin/bash

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date
fi

elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    num_files=100
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        num_files=$2
    fi
    for i in $(seq 1 $num_files); do
        filename="log${i}.txt"
        echo -e "$filename\nskrypt.sh\n$(date)" > "$filename"
    done

elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "--date, -d        Wyświetla dzisiejszą datę"
    echo "--logs [N], -l    Tworzy N plików logx.txt, domyślnie 100"
    echo "--help, -h        Wyświetla pomoc"
fi