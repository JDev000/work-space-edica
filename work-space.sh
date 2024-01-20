# AUTHOR: JEROME EDICA
# You can also use this code as default

# urls=(
    
#     "https://github.com/"
#     "https://chat.openai.com/" 
#     "https://www.messenger.com/t/100003292705119"
# )

# for url in "${urls[@]}"; do
#     start "" "chrome.exe" --new-tab "$url"
# done






urls=(
    "https://www.google.com"
    "https://www.messenger.com"
    "https://github.com/"
    "https://www.pinterest.ph/"
    "https://vercel.com/new"
)

scroll_text() {
    local text=$1
    local width=50
    local delay=0.00001  # Very short delay for super fast animation

    for ((i=0; i<=width; i++)); do
        printf "%*.*s %.*s\r" 0 $i "$text" $((width-i)) "$text"
        sleep $delay
    done
    printf "\n"
}

type_text() {
    local text=$1
    local delay=0  # Very short delay for super fast animation

    for ((i=0; i<${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep $delay
    done
    printf "\n"
}

spinner() {
    local pid=$1
    local delay=0  # Adjusted for super fast animation
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [\e[32m%c\e[0m]  " "$spinstr"  # Green text
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

printf "\n\e[32mAccessing Multiple Sites...\e[0m\n"  # Green text
printf "\e[32m"
type_text ""
type_text "
█████████████████████████████████████████████████████████████████████
█▄─▄▄─█▄─▄▄▀█▄─▄█─▄▄▄─██▀▄─████─▄▄▄▄█▄─█─▄█─▄▄▄▄█─▄─▄─█▄─▄▄─█▄─▀█▀─▄█
██─▄█▀██─██─██─██─███▀██─▀─████▄▄▄▄─██▄─▄██▄▄▄▄─███─████─▄█▀██─█▄█─██
▀▄▄▄▄▄▀▄▄▄▄▀▀▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▀▀▄▄▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▄▀▄▄▄▀"
printf "\e[0m"  # Reset text color
sleep 1  # 3 seconds delay
type_text ""
scroll_text "Access granted. Scanning system..."  # Scrolling text
sleep 1  # 7 seconds delay

# Open all tabs at once
for url in "${urls[@]}"; do
    (start "" "chrome.exe" --new-tab "$url" && echo "done") &
done

spinner $!

# Wait for a moment before closing the terminal
sleep 3

# Close the terminal
exit
