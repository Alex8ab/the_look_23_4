view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: number
    drill_fields: [detail*]

  }

  measure: count1 {
    type: number
    sql: ${user_id} ;;
    value_format : "$#0000"
    html:
    {% if value == 0 %}
    <span style="color:darkgreen;">{{ rendered_value }}</span>
    {% elsif value > 1 %}
    <span style="color:goldenrod;">{{ rendered_value }}</span>
      {% else %}
    <div style="color: blue; font-size:100%; text-align:right">{{ rendered_value }}</div>
    {% endif %} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      order_items_vijaya.count,
      ten_million_orders.count
    ]
  }
}
