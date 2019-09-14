# frozen_string_literal: true

namespace :imap do
  task scan: :environment do
    require 'net/imap'
    require 'mail'
    # setup iniziale
    p = Project.find_or_create_by(name: 'e-Virdis', domains: ['e-Virdis.it', 'eMemory.it', 'eLegacy.app'])
    u = User.find_by(email: 'alessandro.macagno@ememory.it')
    u = User.create(email: 'alessandro.macagno@ememory.it', password: 'changeme') unless u.present?
    p.project_users.create(user: u)
    # analisi mail
    imap = Net::IMAP.new('imappro.zoho.com', 993, true, nil, false)
    imap.login(Rails.application.credentials.email, Rails.application.credentials.password)
    number_of_folders = imap.list('', '*').length
    imap.list('', '*').map(&:name).each_with_index do |inbox, index|
      puts "guardo cartella #{inbox}, #{index} di #{number_of_folders}"
      imap.examine(inbox)
      total_emails_count = imap.search(['ALL']).length
      imap.search(['ALL']).each_with_index do |m, inner_index|
        puts "analizzo #{inner_index} su #{total_emails_count}"
        raw_message = imap.fetch(m, 'RFC822.HEADER').first.attr['RFC822.HEADER']
        parsed_message = Mail.read_from_string raw_message
        from = parsed_message.from
        our_mail = u.our_mails.create(
          from: from,
          message_id: parsed_message.message_id,
          to: parsed_message.to,
          cc: parsed_message.cc,
          bcc: parsed_message.bcc,
          subject: parsed_message.subject,
          # body: parsed_message.body,
          headers: parsed_message.headers,
          date: parsed_message.date
        )
        from.each do |f|
          if p.domains.include?(f.split('@')[1])
            p.project_users.create(user: User.create(email: f, password: 'changeme'))
          else
            #  test che from non sia di p.users
            c = p.companies.find_or_create_by(name: f.split('@')[1], url: f.split('@')[1])
            e = c.employees.find_or_create_by(full_name: f.split('@')[0], emails: [f])
          end
        end
      end
    end
  end
end
