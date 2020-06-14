pub fn is_leap_year(year: u64) -> bool {
    let a = year % 400 == 0;
    let b = year % 100 == 0;
    let c = year % 4 == 0;

     a ||(!b && c)
}