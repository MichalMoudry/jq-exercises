# Task 1: calculate the production rate per hour
def production_rate_per_hour:
    if . >= 1 and . <= 4 then
        {speed: ., success_rate: 1}
    elif . >= 5 and . <= 8 then
        {speed: ., success_rate: 0.9}
    elif . == 9 then
        {speed: ., success_rate: 0.8}
    elif . == 10 then
        {speed: ., success_rate: 0.77}
    else {speed: ., success_rate: 1}
    end
    | .speed * (221 * .success_rate)
;

# Task 2: calculate the number of working items produced per minute
def working_items_per_minute:
  . | production_rate_per_hour / 60 | trunc
;

.speed | (production_rate_per_hour, working_items_per_minute)
