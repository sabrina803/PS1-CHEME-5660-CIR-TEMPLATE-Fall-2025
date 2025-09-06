"""
    function securityterm(duration::String) -> Float64

The `securityterm` function converts a security term duration into a floating point number representing the security term duration in years.

### Arguments
- `duration::String`: A string representing the security term duration. The string should be in the format of `X-Unit` where `X` is a number and `Unit` is a time unit. The time unit can be either `Day`, `Week` or `Year`.

### Return
- `Float64`: A floating point number representing the security term duration in years.
"""
function securityterm(duration::String)::Float64

    # initialize -
    number_of_days_per_week = 7.0;
    number_of_days_per_year = 365.0;
    value = 0.0;
    numerator = 0.0;
    denominator = 1.0;

    # quick check: do we have a valid duration?
    security_term_components = split(duration, "-");
    if (length(security_term_components) != 2)
        throw(ArgumentError("Invalid security term value: $duration"));
    end

    # if we get here, *should* be ok ....
    denominator = number_of_days_per_year; # demominator
    numerator = security_term_components[1] |> String |> x-> parse(Float64,x);  # number of time units

    # get the duration - we don't need to check for the Days case, as we are using the denominator
    unit_of_time = security_term_components[2];
    if (unit_of_time == "Week")
        numerator *= number_of_days_per_week;    
    elseif (unit_of_time == "Year")
        numerator *= number_of_days_per_year;
    end   
    
    # calculate -
    value = numerator / denominator;

    # return -
    return value;
end