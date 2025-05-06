#!/bin/bash

if [[ "$1" == "--date" ]]; then
    date
fi

elif [[ "$1" == "--logs" ]]; then
    num_files=100
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        num_files=$2
    fi
    for i in $(seq 1 $num_files); do
        filename="log${i}.txt"
        echo -e "$filename\nskrypt.sh\n$(date)" > "$filename"
    done

elif [[ "$1" == "--help" ]]; then
    echo "--date        Wyświetla dzisiejszą datę"
    echo "--logs [N]    Tworzy N plików logx.txt"
    echo "--help        Wyświetla pomoc"
fi