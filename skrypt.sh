#!/bin/bash

function create_logs() {
    local count=$1
    for i in $(seq 1 "$count"); do
        filename="log${i}.txt"
        echo -e "$filename\nskrypt.sh\n$(date)" > "$filename"
    done
}

function create_errors() {
    local count=$1
    mkdir -p errorx
    for i in $(seq 1 "$count"); do
        filename="errorx/error${i}.txt"
        echo -e "$filename\n$0\n$(date)" > "$filename"
    done
}

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date

elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    num_files=100
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        num_files=$2
    fi
    create_logs "$num_files"

elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    num_errors=100
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        num_errors=$2
    fi
    create_errors "$num_errors"

elif [[ "$1" == "--init" ]]; then
    git clone "$(git config --get remote.origin.url)" cloned_repo
    echo "export PATH=\$PATH:$(pwd)/cloned_repo" >> ~/.bashrc
    echo "Ścieżka dodana do PATH (na stałe po ponownym zalogowaniu)."

elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "--date, -d         Wyświetla dzisiejszą datę"
    echo "--logs [N], -l     Tworzy N plików logx.txt, domyślnie 100"
    echo "--error [N], -e    Tworzy N plików errorx/errorx.txt, domyślnie 100"
    echo "--init             Klonuje repo i dodaje do PATH"
    echo "--help, -h         Wyświetla pomoc"

else
    echo "Nieznana opcja. Użyj --help, aby uzyskać listę dostępnych opcji."
fi

