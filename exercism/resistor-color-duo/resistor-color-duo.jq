def get_color_code:
    if . == "black" then 0
    elif . == "brown" then 1
    elif . == "red" then 2
    elif . == "orange" then 3
    elif . == "yellow" then 4
    elif . == "green" then 5
    elif . == "blue" then 6
    elif . == "violet" then 7
    elif . == "grey" then 8
    elif . == "white" then 9
    end
;

def print_color_code:
    if .[0] > 0 then
        "\(.[0])\(.[1])"
    else
        "\(.[1])"
    end
;

.colors | map(get_color_code) | print_color_code