# Companies
company = Company.create(name: 'StudioMX')

# Users
admin = User.create(company_id: company.id, password: 'password', first_name: 'Jason', last_name: 'Dunlop', email: 'jason@example.com', admin: true, permissions: [{"team"=>1, "projects"=>2, "dashboard"=>2, "forecasting"=>2}])
user1 = User.create(company_id: company.id, password: 'password', first_name: 'Aldo', last_name: 'Last', email: 'aldo@example.com', admin: false, permissions: [{"team"=>1, "projects"=>2, "dashboard"=>2, "forecasting"=>2}])
user2 = User.create(company_id: company.id, password: 'password', first_name: 'Daniel', last_name: 'Last', email: 'daniel@example.com', admin: false, permissions: [{"team"=>1, "projects"=>2, "dashboard"=>2, "forecasting"=>2}])
user3 = User.create(company_id: company.id, password: 'password', first_name: 'Daniela', last_name: 'Last', email: 'daniela@example.com', admin: false, permissions: [{"team"=>0, "projects"=>0, "dashboard"=>0, "forecasting"=>0}])
user4 = User.create(company_id: company.id, password: 'password', first_name: 'Dayana', last_name: 'Last', email: 'dayana@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user5 = User.create(company_id: company.id, password: 'password', first_name: 'Eduardo', last_name: 'Last', email: 'eduardo@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user6 = User.create(company_id: company.id, password: 'password', first_name: 'Fernando', last_name: 'Last', email: 'fernando@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user7 = User.create(company_id: company.id, password: 'password', first_name: 'Gabs', last_name: 'Last', email: 'gabs@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user8 = User.create(company_id: company.id, password: 'password', first_name: 'Gaby', last_name: 'Last', email: 'gabby@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user9 = User.create(company_id: company.id, password: 'password', first_name: 'JD', last_name: 'Last', email: 'jd@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user10 = User.create(company_id: company.id, password: 'password', first_name: 'Jesus', last_name: 'Last', email: 'jesus@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user11 = User.create(company_id: company.id, password: 'password', first_name: 'Lizeth', last_name: 'Last', email: 'lizeth@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user12 = User.create(company_id: company.id, password: 'password', first_name: 'Melissa', last_name: 'Last', email: 'melissa@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])
user13 = User.create(company_id: company.id, password: 'password', first_name: 'Saul', last_name: 'Last', email: 'saul@example.com', admin: false, permissions: [{"team"=>1, "projects"=>1, "dashboard"=>1, "forecasting"=>1}])

# Projects
project1 = Project.create(company_id: company.id, title: 'Lori Lane')
task1 = Task.create(project_id: project1.id, title: 'Billable', billable: true)
task1.user_ids = [user1.id, user7.id]
task1.save

project2 = Project.create(company_id: company.id, title: 'Airway Gardens')
task2 = Task.create(project_id: project2.id, title: 'Billable', billable: true)
task2.user_ids = [user1.id, user2.id, user4.id]
task2.save

project3 = Project.create(company_id: company.id, title: 'Woodland')
task3 = Task.create(project_id: project3.id, title: 'Billable', billable: true)
task3.user_ids = [user1.id, user2.id, user4.id]
task3.save

project4 = Project.create(company_id: company.id, title: 'MAG: TSR')
task4 = Task.create(project_id: project4.id, title: 'Billable', billable: true)
task4.user_ids = [user1.id, user11.id]
task4.save

project5 = Project.create(company_id: company.id, title: 'Spanish Peaks')
task5 = Task.create(project_id: project5.id, title: 'Billable', billable: true)
task5.user_ids = [user1.id]
task5.save

project6 = Project.create(company_id: company.id, title: '3Plex')
task6 = Task.create(project_id: project6.id, title: 'Billable', billable: true)
task6.user_ids = [user1.id, user11.id]
task6.save

project7 = Project.create(company_id: company.id, title: 'Broken Wheel')
task7 = Task.create(project_id: project7.id, title: 'Billable', billable: true)
task7.user_ids = [user1.id, user4.id]
task7.save

project8 = Project.create(company_id: company.id, title: 'Payne')
task8 = Task.create(project_id: project8.id, title: 'Billable', billable: true)
task8.user_ids = [user1.id, user3.id, user11.id, user13.id]
task8.save

project9 = Project.create(company_id: company.id, title: 'White Clouds')
task9 = Task.create(project_id: project9.id, title: 'Billable', billable: true)
task9.user_ids = [user1.id]
task9.save

project10 = Project.create(company_id: company.id, title: 'MAT Architects')
task10 = Task.create(project_id: project10.id, title: 'Billable', billable: true)
task10.user_ids = [user2.id]
task10.save

project11 = Project.create(company_id: company.id, title: 'DUT-7')
task11 = Task.create(project_id: project11.id, title: 'Billable', billable: true)
task11.user_ids = [user2.id, user5.id, user13.id]
task11.save

project12 = Project.create(company_id: company.id, title: 'Skyline HS')
task12 = Task.create(project_id: project12.id, title: 'Billable', billable: true)
task12.user_ids = [user1.id, user8.id]
task12.save

project13 = Project.create(company_id: company.id, title: 'Sargent')
task13 = Task.create(project_id: project13.id, title: 'Billable', billable: true)
task13.user_ids = [user2.id]
task13.save

project14 = Project.create(company_id: company.id, title: 'Mark Design')
task14 = Task.create(project_id: project14.id, title: 'Billable', billable: true)
task14.user_ids = [user3.id, user4.id, user7.id, user8.id, user11.id]
task14.save

project15 = Project.create(company_id: company.id, title: 'Layton Temple')
task15 = Task.create(project_id: project15.id, title: 'Billable', billable: true)
task15.user_ids = [user3.id, user4.id, user5.id, user11.id, user12.id]
task15.save

project16 = Project.create(company_id: company.id, title: 'Washington County Temple')
task16 = Task.create(project_id: project16.id, title: 'Billable', billable: true)
task16.user_ids = [user3.id, user4.id, user8.id, user11.id, user12.id]
task16.save

project17 = Project.create(company_id: company.id, title: 'Lonestar')
task17 = Task.create(project_id: project17.id, title: 'Billable', billable: true)
task17.user_ids = [user4.id]
task17.save

project17 = Project.create(company_id: company.id, title: 'Payne & Payne')
task17 = Task.create(project_id: project17.id, title: 'Billable', billable: true)
task17.user_ids = [user4.id, user8.id]
task17.save

project18 = Project.create(company_id: company.id, title: 'Okinawa Temple')
task18 = Task.create(project_id: project18.id, title: 'Billable', billable: true)
task18.user_ids = [user4.id, user8.id]
task18.save

project19 = Project.create(company_id: company.id, title: 'LUDVIK')
task19 = Task.create(project_id: project19.id, title: 'Billable', billable: true)
task19.user_ids = [user5.id, user6.id, user7.id, user10.id]
task19.save

project20 = Project.create(company_id: company.id, title: 'MAG: QH RES')
task20 = Task.create(project_id: project20.id, title: 'Billable', billable: true)
task20.user_ids = [user5.id,user13.id]
task20.save

project21 = Project.create(company_id: company.id, title: 'BECK: SSCV PENTHOUSE VDC')
task21 = Task.create(project_id: project21.id, title: 'Billable', billable: true)
task21.user_ids = [user5.id, user6.id, user13.id]
task21.save

project22 = Project.create(company_id: company.id, title: 'ARC Design')
task22 = Task.create(project_id: project22.id, title: 'Billable', billable: true)
task22.user_ids = [user7.id, user8.id, user11.id, user12.id]
task22.save

project23 = Project.create(company_id: company.id, title: 'QH RESIDENCE')
task23 = Task.create(project_id: project23.id, title: 'Billable', billable: true)
task23.user_ids = [user8.id, user13.id]
task23.save

project24 = Project.create(company_id: company.id, title: 'Hunt Electric')
task24 = Task.create(project_id: project24.id, title: 'Billable', billable: true)
task24.user_ids = [user10.id]
task24.save

project24 = Project.create(company_id: company.id, title: 'DAHLIN')
task24 = Task.create(project_id: project24.id, title: 'Billable', billable: true)
task24.user_ids = [user11.id]
task24.save
