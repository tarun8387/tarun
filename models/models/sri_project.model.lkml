connection: "denodo"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: sri_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sri_project_default_datagroup

explore: all_types {}

explore: customer {}

explore: lineitem {}

explore: nation {}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${order_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: part {}

explore: partsupp {}

explore: region {}

explore: supplier {}

explore: test {
  join: users {
    type: left_outer
    sql_on: ${test.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: test1 {}

explore: test10 {}

explore: test11 {}

explore: test12 {}

explore: test13 {}

explore: test14 {}

explore: test15 {}

explore: test16 {}

explore: test17 {}

explore: test18 {}

explore: test19 {}

explore: test2 {}

explore: test20 {}

explore: test3 {}

explore: test4 {}

explore: test5 {}

explore: test6 {}

explore: test7 {}

explore: test8 {}

explore: test9 {}

explore: users {}
