require 'rails_helper'

feature 'Visitor visits home and does not see jobs expired' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga Expirada',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo',
               company: company,
               category: category,
               created_at: '2016-01-01 22:21:51.524367')

    visit root_path
    within('.jobs:first-child') do

    expect(page).not_to have_content job.title
    expect(page).not_to have_content job.category.name
    expect(page).not_to have_content job.description
    expect(page).not_to have_content job.location
   end
 end
scenario 'Visitor visits job expired' do
  company = Company.create(name:     'Campus Code',
                           location: 'São Paulo',
                           mail:     'contato@campuscode.com.br',
                           phone:    '2369-3476')

  category = Category.create(name: 'Desenvolvedor')

  job = Job.create(title: 'Dev',
             description: 'Dev Junior Rails com ao menos um projeto',
             location: 'São Paulo',
             company: company,
             category: category,
             created_at: '2016-01-01 22:21:51.524367')

  visit job_path(job.id)


  expect(page).to have_content('Vaga Expirada')
  expect(page).not_to have_content job.title
  expect(page).not_to have_content job.category.name
  expect(page).not_to have_content job.description
  expect(page).not_to have_content job.location
  end
end
