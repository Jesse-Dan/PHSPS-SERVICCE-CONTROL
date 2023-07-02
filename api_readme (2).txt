PHSPS Customer/Client List API

https://api1.phsps.com/api/customer


Routes(Protected)

/customer                           =Gets all the customers (Ordered by bname ASC)
/customer/{id}                      =Gets single customer with the id {id}
/search/{Business Name}             =Gets all businesses whose name contain {Business Name}
/month/{The Month}                  =Gets all business whose renewal month is {The Month}
/sum                                =Gets the total annual subscription fee of all customers
/sum/{The Month}                    =Gets the sum of expected subscription for {The Month}

Routes(Public)

/login                        =takes email and password; (generates a bearer token)
/register                     =name, email, password, password_confirmation; (generates a bearer token)



Customer Details Fields(All Required)

bname,
oname,
bphone - unique,
ophone,
bemail - unique,
oemail,
blocation,
setup_fee,
annual_sub,
job_status,
join_date,
renewal_month,
renewal_date
