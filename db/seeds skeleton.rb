# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create(
#     [{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]
#   )
#   Character.create(name: 'Luke', movie: movies.first)

# PROCESS OWNERS
process_owner_1 = ProcessOwner.create( { name: 'KelTech', address1: '3510 South Pine Street', city: 'Tacoma', state: 'WA', zip: '98409', country: 'USA'})
# CUSTOMERS
customer_2 = process_owner_1.customers.create( { name: 'Alpha Precision Machining Inc.', address1: '19652 70TH Ave S', city: 'Kent', state: 'WA', zip: '98032-1138', country: 'United States'})
# SUPPLIERS
supplier_2 = process_owner_1.suppliers.create( { name: 'Merit Harbor Capital', address1: '', city: '', state: '', zip: '', country: ''})

#USERS	# PEOPLE
user_1 = process_owner_1.users.create( { email: 'DKeller@keltechplastics.com', password: 'letmein' } )	; user_1.person.update( { first_name: 'Deanna', last_name: 'Keller', job_title: 'President', telephone: ''})	; person_1 = Person.find_by( user: user_1 )
user_2 = process_owner_1.users.create( { email: 'KButler@keltechplastics.com', password: 'letmein' } )	; user_2.person.update( { first_name: 'Kevin', last_name: 'Butler', job_title: '', telephone: ''})	; person_2 = Person.find_by( user: user_2 )
user_15 = customer_2.users.create( { email: 'dean@alphapre.com', password: 'letmein' } )	; user_15.person.update( { first_name: 'Dean', last_name: 'Conti', job_title: 'Owner', telephone: '253.395.7381'})
user_73 = supplier_2.users.create( { email: 'Charles.Morningstar@meritharborcapital.com', password: 'letmein' } )	; user_73.person.update( { first_name: 'Charles', last_name: 'Morningstar', job_title: 'Director', telephone: '253.327.1072'})

# DATE
date_20171208 = DateLookup.create( { date: '2017-12-08', day_of_month: 8, month: 12, quarter: 4, year: 2017, week_of_year: 49, week_of_quarter: 2})

workshop_1 = process_owner_1.workshops.create( { process_name: '“Nordstrom Rollout”: Large Production Run with Design & Prototype',	left_boundary: 'Initial Sales Meeting',	right_boundary: 'Invoicing', capability_goal: 'Increase predictability of internal and external milestones and deliverables from about a 30% on-time to 80% on-time', date_lookup: date_20171208 })

# LOOKUPS
lookup_2 = LookupSolutionType.create!( { sequence: 10, short_text: 'ADTE', long_text: 'Analyze, Design, Train, and Enforce', description: ''})
lookup_13 = LookupWorkshopRole.create( { sequence: 10, short_text: 'Sponsor', long_text: 'Sponsor', description: ''})
lookup_14 = LookupWorkshopRole.create( { sequence: 20, short_text: 'Host', long_text: 'Host', description: ''})

# ACTION RESULT
action_result_110 = workshop_1.action_results.create!( { ar_number: 110, action: 'Quality Customer', result: 'Customer Qualified' } )
action_result_120 = workshop_1.action_results.create!( { ar_number: 120, action: 'Define Scope', result: 'Scope Defined' })
action_result_130 = workshop_1.action_results.create!( { ar_number: 130, action: 'Provide Options', result: 'Options Provided' } )


# TOE TAGS
toe_tag_1 = workshop_1.toe_tags.create!( { priority: 1, big_small_now: 'Small Now', solution: 'DESIGN, TRAIN & ENFORCE information needed from client.', lookup_solution_type: lookup_2, success_measurement: 'Improved communication'})
toe_tag_12 = workshop_1.toe_tags.create!( { priority: 12, big_small_now: 'Big Now', solution: 'RE-DESIGN & IMPLEMENT file management system (eg. uniform naming)', lookup_solution_type: lookup_2, success_measurement: 'Can we find all files in a timely fashion?'})

# PAIN POINTSs
pain_point_1 = action_result_110.pain_points.create!({ symptom: 'How information is stored and shared withing the company. i.e. file management system - (broken links)', toe_tag: toe_tag_12 })
pain_point_2 = action_result_120.pain_points.create!({ symptom: 'Info not gathered from customer to clearly define scope of work', toe_tag: toe_tag_1 })
pain_point_3 = action_result_130.pain_points.create!({ symptom: 'No budget for options to be provided', toe_tag: toe_tag_1 })

# STATUS UPDATES
status_update_1 = action_result_110.action_result_updates.create( { text: 'Phasellus pretium diam augue. Vestibulum consectetur neque metus, et facilisis nisl sodales id. Integer tincidunt lectus vitae dolor mattis, ut tristique elit fringilla. Vivamus turpis diam, tempus quis volutpat eu, condimentum ut orci. Aliquam venenatis nec quam ut viverra. Nunc accumsan diam id consequat posuere. Nullam dignissim erat quis elementum accumsan. Donec feugiat nisl in ligula iaculis feugiat. Integer scelerisque mauris ut sapien feugiat, ac ullamcorper purus tincidunt. Curabitur blandit leo ac leo ornare tempus. Etiam libero justo, iaculis sit amet pulvinar at, accumsan sed eros. Vivamus volutpat felis fringilla felis posuere imperdiet.' } )

# GROUP ASSOCIATIONS
group_association_1 = Triager.create( { person: person_1, workshop: workshop_1 } )
group_association_2 = workshop_1.triagers.create( { person: person_2, lookup_workshop_role: lookup_13 } )
# group_association_1 = workshop_1.triagers.create( { person: person_1, lookup_workshop_role: lookup_13 } )
# group_association_2 = workshop_1.triagers.create( { person: person_2, lookup_workshop_role: lookup_14 } )

customer_job_1 = customer_2.customer_jobs.create( { process_owner: process_owner_1, order_date_id: 347, due_date_id: 369, job_name: 'Customer Job 1', job_description: 'Phasellus pretium diam augue. Vestibulum consectetur neque metus, et facilisis nisl sodales id. Integer tincidunt lectus vitae dolor mattis, ut tristi', ref_number: 'PO#: 4119485-8088' } )

customer_job_2 = process_owner_1.customer_jobs.create( { customer: customer_2, order_date_id: 131, due_date_id: 145, job_name: 'Customer Job 2', job_description: 'Aenean laoreet mi eget dictum tempus. Maecenas consectetur felis consequat neque vulputate, ultrices hendrerit purus lobortis. Proin molestie, tellus ', ref_number: 'PO#: 6711249-6574' } )