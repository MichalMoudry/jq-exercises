def steps:
    def _steps(current; num):
        if current <= 0 then
            "Only positive integers are allowed" | halt_error
        elif current == 1 then
            num
        elif current % 2 == 0 then
            _steps(current / 2; num + 1)
        else
            _steps(current * 3 + 1; num + 1)
        end;
    _steps(.; 0)
;

.number | steps
