# Analyze Pizza Restaurant Data with SQL

The project aims to establish data model and and conduct an analysis of a pizza restaurant data by using SQL to achieved.  
This will be achieved through the creation of relevant data tables, data manipulation techniques, and the formulation of targeted SQL queries to uncover valuable insights from the sales data.

  The questions want to extract from data are:
1. Number of pizza's sold each day during 01/01/2022 to 31/01/2022.
    1.1 number of pizza were ordered by membership custoemr
    1.2 number of pizza were ordered by non-membership customer
  2.  Ranking popularity of each menu category (pizza, appetizer, beverage) by unit sold  in January, 2022.
  3. Menu were not sold in January 2022
  4. Top 5 customer most spends, date recent he/her come by, how many orders,
  how much he/her spends each time, and how many he/her's total spends.

  Transaction table contain sale orders during 09/01/2022 to 01/02/2022 with separated into 2 table.  To analyze January 2022 sales, Data need to manipulate before extract.

## Table of contents
- [Overview process](#overview-process)
- [Command used](#command-used)
- [Files](#files)
- [How to run](#how-to-run)


## Overview process

This project is from scratch. The process started with build model, generate data, and edit data before query and analyze.

## Command used

DDL:
- CREATE
- ALTER

DML:
- INSERT
- UPDATE
- DELETE

DQL:
- SELECT
- MERGE
- SUB QUERY

## Files
- *data_create.sql* -> Contain DDL commands to perform building data model and generating transaction
- *data_edit.sql* -> Contain DML commands to perform editing generated data
- *main.sql* -> Contain DQL commands to query and analyze data
- *orders_data_diagram.jpg* -> Data schema and relationship [view resource](https://viewer.diagrams.net/?tags=%7B%7D&highlight=4F5359&edit=_blank&layers=1&nav=1&title=Analyze_pizza_restaurant_withSQL.drawio#R7Vxbc9o4FP41zOw%2bZMcXDPgxQNLuTLrJNJnttC8dYQujqW2xskggv351t3wDmpCQZGg6AR3d7HO%2b7%2bgcyU7Pn2TrTwQsF19wDNOe58Trnj/teZ47GPbZB5dspGQQelKQEBSrRqXgFj1CJXSUdIViWFQaUoxTipZVYYTzHEa0IgOE4IdqszlOq7MuQQIbgtsIpE3pNxTThZSOvGEp/wxRslAzByNfVsxA9CsheJWr6XqefzHmP7I6A3oodZ/FAsT4wRL5Fz1/QjCm8lu2nsCUq1ZrTfa77Kg1l01gTvfpMPvxT7L%2bcX37%2beeFd315t/o38wdnapR7kK6gvo1BysYbzzEblms9xUTUDP5b8Utlt%2bdHc/5ji5xC21XL3Go13aSwNoz1LVGfYuZZa3t%2bPWdylnPWwB05y3XrMHeIIgKoHo0pZFafgcnk7WmxV5nSo3DN5QuapUzgsq8gRUnOvkdM2ZDpY3wPCUUMROeqIkNxzLuPHxaIwtsliPhYD4wyTCZQArkdHFGigCLMe525jpmfjwjXncZ1DWQYEyHOICUb1kR38BQqFQl9jbqHEtLBSBFzYcHZ7auGQNEoMWOXWGJfFJzaoTX/9n053Ew/XX/HgyC6//Et/ntzNvRbsFVTdKkYt0N1lg3mKE0nCo45zrmyl5AgdrWQ8F4oT5SGAYmUn2EqG6dgBtOxYWttiIIS/AvWhB3qbzFSt0X6YcUi2p/YBvGdpkGM8PAG6eR6gyCK/HuwsIOE0aqg7LJJ8ZPO0k7atTG0hpDiAWUpEEbhfW9VDbdytEBpfAU2eMVVV1BmYV0aLzBBj6w90OBh1YQqUPhOpcUt76m5CfnN3WjDuzXRF7CuNLwCBdVXg9MULAs0E9fHO2aAJCgfY8o0oRrtQPh2pFbJYrOBueQ5%2bzcadeFZa/EK5frqzHLkmk56%2bfMOxIBRlQFu0PRJxv1UfNJoCwXUdF9ZKADyhCm7nC90avOFzfmClvnqjAMp8yg5oHDMNV40iGdu9elcHDW4yBjDejC3fen0wste2O%2bFrmZIsQR5Kx3V6sypSJIZ%2bIPdCLsep/bxp1yDBXfnIEPpRnbJcI4LCUZTX3Jbr68OXw3PJFi5PMcKuG0reFAPFAOmFC4VcY4paSUFQk1MMuXf%2bZoVcL0ETN272rqmrUbpk4bxymGkMUxNWSH1bioYc5aySAFj%2b1fGIlawXQ6vc4SwdDuWTJHxMwRxi3iMWSRdikuec5ngMxfb7qZsHBO8vGNuB1JLuMQop4W%2b/mAsfgkdTZy/Al4S9zURcrcuF7/4IIROcM4cBUBK15A5vwdYiMKY4qU1ZQrn9hUQwbWyPJM%2bsRRYRpDuZR8zmypj4dIHBdwrmJbBqISEsynl/TAs5dJLlKPbfZS3MJW%2bVQeKUp5YF1AHoCgaFG5Hpf8cVDI9UQRSy0MKvIjsCVTx0gGurcZsGK9uXRijch5XiDAz6zyVRJkuWKgMcyG31kNeIxyL4BJfE8vuT4KHUVU7PGrm9g9gbTORrfqDzNRYkTrhZd3jE3DX78QdVc3fOPZknsbLuidfPHlqcKVHGrxVRFqD2Dio%2b6Xg1ZD6pKkODlUhrIYPeoB6nGHyCRkwbc/uWwPlelQdzoc84jb5v0DVluzfBps/7ZeSryrc5CKDPYM8s0izWdkCLZZnsQjz1XfSE8uyLrP/jeXYWozV/gKYmTxpV1ptpVW/k4Q49SSimTJsTUN35xGbani%2bK214scQ5bATrKdN2DjJ4wtZhEtpXw9Lg2FjSu94WmOaInND0LtEUHhtNXnOPVQZqJyC9KyC5Ldv1r4ykfgNJMAPoBKV3B6V9d1lfbonrPlRsP9rrPgp89jkEJvHpEOIFDyG4NuT9uH7TAUQxnI1mb%2bpQoh%2bOKocEYpf82YcSz%2bOL1%2bCLgC3fmDk531dJXWtQdFqxtt3ZvZ901gva8RYD%2bqwU5DK8HF5MPzbi3gXCjp/kNtOS%2bvHmsBdOT%2b7tA4Dt6Dmw28xcMpivTmj7iGh7A4nyoAE3kDHl0BO%2bPgK%2bjp89N6Ozl3tMjzvKU3L8Wk/oRVEYvqlkuP6EXn/vZNh7Mfg33WtjNZePxp287Vs61TVu6/3kwW7zgWgOtROyjrvj/ftIOn6%2b23ycd0lQdDrQfXdQOno267UdntRQBOMEat/OjLHACc5BelFKK/vyXlXnMI/P%2bVtzrHjxlSn6Dn8B%2bUbHX2VVBvL4uiWqgWtEpzrGEoWNLuRMAWWVKJm6dCbG1ehlohgUCzNqtCL3xtQcoOc5yvRbUpVgyFFdbwDlD5oxCSOfM9qJJq4SLYrhHKxS2gokHVngFYngHoEKlY9b796f4FbbCkEbc05b0KWFBKZMNfewcsFb3pW4weKR7fLNpOq7Yv1BDczy3lWvEs%2bNgbzaQH59IKmbxkCHeolCU%2bN1uPIICT6R5WlkGe3LFf%2bNcaV/KK4Ex%2bZK99t/C7d1D0Emx2f8eWy5iTD4y9H7CI6qlDGJ/bbQb5/kN7vcoMdHIExXMNCCXM0wZZGFGIGsIroicPeeBb%2bxHc8APzVmqgc6B4yhtvijxlvISQqKoqdfK7Y9T2eYKIkvDvxqpOc6ubU9x3YfwZtfc21RDumRoy79Ur1gNr0DC5yBujfqOjNsixSrYfIefmj/nQ/z1wcUHVu2/frOsOlX6qzdI%2b7rqafXLTqXz637F/8D)
- *orders_data_dictionary.jpg* -> Meaning of table's schema [view source](https://docs.google.com/spreadsheets/d/10zDi-xkZL9qynaulXbuZ0N8cjFaOmS46/edit?usp=sharing&ouid=101172310143359403390&rtpof=true&sd=true)
- *README.md* -> Project information and guide
- *RESULT_IMG.jpg* -> Result from run project

## How to run
Due to **Replit** updated, You can run project by _click_  `'Fork & Run'`  _button_ at [Replit here](https://replit.com/@TitiratSuwanrat/AnalyzePizzaRestaurantDatawithSQL#README.md).  
Replit will _**create a copy and execute**_ project within your workspace. The results will be displayed in the console,  located at *main.sql* by default. Also, You can view result at *RESULT_IMG.jpg* as well.<br>

Visit tableau dashboard [here](https://public.tableau.com/views/PizzaSalesanalysis_17154271579650/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)
