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

elif [[ "$1" == "--init" ]]; then
    git clone "$(git config --get remote.origin.url)" cloned_repo
    echo "export PATH=\$PATH:$(pwd)/cloned_repo" >> ~/.bashrc
    echo "Ścieżka dodana do PATH (na stałe po ponownym zalogowaniu)."

elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    num_errors=100
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        num_errors=$2
    fi

    mkdir -p errorx
    for i in $(seq 1 "$num_errors"); do
        filename="errorx/error${i}.txt"
        echo -e "$filename\n$0\n$(date)" > "$filename"
    done
