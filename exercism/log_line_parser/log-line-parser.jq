# We haven't covered regular expressions yet.
# This function will remove leading and trailing whitespace
# from the input string.
def trim: sub("^\\s+"; "") | sub("\\s+$"; "");

def split_log: trim | split(" ");

# Task 1. Get message from a log line
def message:
  split_log
  | .[1:]
  | join(" ")
  | trim
;

# Task 2. Get log level from a log line
def log_level:
  split_log
  | .[0] / ""
  | .[1:-2]
  | add
  | ascii_downcase
;

# Task 3. Reformat a log line
def reformat:
  trim
  | {level: log_level, msg: message}
  | "\(.msg) (\(.level))"
;
