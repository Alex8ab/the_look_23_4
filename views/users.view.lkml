view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
    html:
    {% if value > 18 %}
    <span style="color:darkgreen;">{{ rendered_value }}</span>
    {% elsif value > 25 %}
    <span style="color:goldenrod;">{{ rendered_value }}</span>
    {% else %}
    <div style="color: blue; font-size:100%; text-align:right">{{ rendered_value }}</div>
    {% endif %} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    html:
    {% if value == "Angola" %}
    <span style="color:darkgreen;">{{ rendered_value }}</span>
    {% elsif value =="Aurora" %}
    <span style="color:goldenrod;">{{ rendered_value }}</span>
    {% else %}
    <div style="color: blue; font-size:100%; text-align:right">{{ rendered_value }}</div>
    {% endif %} ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    html:
    {% if value == "USA" %}
    <span style="color:darkgreen;">{{ rendered_value }}</span>
    {% elsif value =="INDIA" %}
    <span style="color:goldenrod;">{{ rendered_value }}</span>
    {% else %}
    <div style="color: blue; font-size:100%; text-align:right">{{ rendered_value }}</div>
    {% endif %} ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
