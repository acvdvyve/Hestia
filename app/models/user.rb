class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  devise :cas_authenticatable, :database_authenticatable

  # this should add all extra CAS attributes returned by the server to the current session
  # extra var in session: cas_givenname, cas_surname, cas_ugentStudentID, cas_mail, cas_uid (= UGent login)
  def cas_extra_attributes=(extra_attributes)
    extra_attributes.each do |name, value|
      # I prefer a case over reflection; this is safer if we suddenly get an
      # extra attribute without column
      case name.to_sym
      when :givenname
        self.cas_givenname = value
      when :surname
        self.cas_surname = value
      when :ugentStudentID
        self.cas_ugentStudentID = value
      when :mail
        self.cas_mail = value
      when :uid
        self.cas_uid = value
      end
    end
    self.save!
  end

  # return Givenname + surname or username if these don't exist
  def display_name
    if cas_surname and cas_givenname
      cas_givenname + ' ' + cas_surname
    else
      username
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

#   =begin
# def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
#     user = User.where(:provider => auth.provider, :uid => auth.uid).first
#     if user
#       return user
#     else
#       registered_user = User.where(:email => auth.info.email).first
#       if registered_user
#         return registered_user
#       else
#         user = User.create(name:auth.extra.raw_info.name,
#                             provider:auth.provider,
#                             uid:auth.uid,
#                             email:auth.info.email,
#                             password:Devise.friendly_token[0,20]
#                           )
#       end

#     end
#   end
#   =end

end
