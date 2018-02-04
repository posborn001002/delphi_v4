#!/usr/bin/env bash

rails generate scaffold ActionResult  Organization:references ar_number:integer:index action:string result:string  -f
rails generate scaffold PainPoint Workshop:belongs_to description:text -f
rails generate scaffold Workshop DateLookup:references Person:references -f
rails generate scaffold Update DateLookup:references Person:references ActionResult:references job_order_id:id job_order_type:string attachment:string text:text -f
rails generate scaffold ToeTag priority:integer Person:references -f
rails generate scaffold Metric ActionResult:references name:string datatype:string -f
rails generate scaffold Measurement DateLookup:references:index Metric:references:index value:decimal -f
rails generate scaffold PainPointUpdate PainPoint:references:index progress_id:references:index progress_type:string pass_fail:integer -f
rails generate scaffold DateLookup date:date:index:uniq day_of_month:integer month:integer quarter:integer year:integer week_of_year:integer week_of_quarter:integer -f
rails generate scaffold SupplierOrder order_name:text ref_number:string -f

rails generate migration CreateJoinTableAttendee workshop person -f
rails generate migration CreateJoinTableTeam toe_tag person -f
rails generate migration CreateJoinTableToeTagPainPoint toe_tag pain_point -f
rails generate migration CreateJoinTableJobProgress customer_job action_result -f
rails generate migration CreateJoinTableOrderProgress supplier_order action_result -f
rails generate migration CreateJoinTableOrganizationRelationship organization organization -f
rails generate migration CreateJoinTableJobContact customer_job person -f
rails generate migration CreateJoinTableOrderContact supplier_job person -f



