require 'redmine'

Redmine::Plugin.register :redmine_evolvingweb_extensions do
  name 'Redmine Evolving Web Extensions'
  author 'Alex Dergachev'
  url 'https://github.com/evolvingweb/redmine_evolvingweb_extensions'
  author_url 'http://evolvingweb.ca'
  description 'Contains misc extensions to our local Redmine instance'
  version '0.0.1'
  requires_redmine :version_or_higher => '0.8.0'


  Redmine::WikiFormatting::Macros.register do
    desc "Alias {{id(100)}} to {{issue_details(100)}}" 
    macro :id do |obj, args|
      # return Redmine::WikiFormatting::Macros::Definitions.new.methods.inspect
      args = args.join(", ")
      return exec_macro('issue_details', obj, args, nil)
      return Redmine::WikiFormatting::Macros.available_macros.inspect
      return macro_exists?("issue_details")
    end
  end
end