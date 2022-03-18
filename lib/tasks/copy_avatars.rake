# frozen_string_literal: true

task copy_avatars: :environment do
  User.find_each do |user|
    avatar = user.avatar
    next unless avatar.attached?

    user.s3_avatar.attach(io: StringIO.new(avatar.download), filename: avatar.filename)
  end
end
