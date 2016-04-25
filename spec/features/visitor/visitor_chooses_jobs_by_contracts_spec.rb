require 'rails_helper'

feature 'Visitor chooses jobs by contract' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')
    contract = Contract.create(name: 'CLT')

    job = Job.create(title: 'Vaga de Dev',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo',
               company: company,
               contract: contract,
               category: category)

    job_2 = Job.create(title: 'Vaga de Dev',
                       description: 'Dev Junior Rails com ao menos um projeto',
                       location: 'São Paulo',
                       company: company,
                       contract: contract,
                       category: category)
    visit root_path

    click_on contract.name

    expect(page).to have_content category.name

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content job.contract.name

    expect(page).to have_content job_2.title
    expect(page).to have_content job_2.category.name
    expect(page).to have_content job_2.description
    expect(page).to have_content job_2.location
    expect(page).to have_content job_2.contract.name
  end

  scenario 'and does not see other category jobs' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')
    contract = Contract.create(name: 'PJ')
    contract_2 = Contract.create(name: 'Freelancer')

    job = Job.create(title: 'Vaga de Dev',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo',
                     company: company,
                     contract: contract,
                     category: category)

    visit root_path

    click_on contract_2.name

    expect(page).to have_content contract_2.name

    expect(page).not_to have_content job.title
    expect(page).not_to have_content job.category.name
    expect(page).not_to have_content job.description
    expect(page).not_to have_content job.location
    expect(page).not_to have_content job.contract.name
  end

end
