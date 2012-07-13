# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
universities = ["慶應義塾大学"]
universities.each do |u|
  unless University.exist(u)
    puts u
#    University.create(:name => u)
  end
end
=end

u = "慶應義塾大学"
unless University.exist(u)
  University.create(:name => u)
end

departments = ["文学部", "経済学部", "法学部", "商学部", "医学部", "理工学部", "総合政策学部", "環境情報学部", "看護医療学部", "薬学部"]
departments.each do |d|
  unless Department.exist(d)
    Department.create(:name => d)
  end
end

university_department_relationships = [["慶應義塾大学", "文学部"], ["慶應義塾大学", "経済学部"], ["慶應義塾大学", "法学部"], ["慶應義塾大学", "商学部"], ["慶應義塾大学", "医学部"], ["慶應義塾大学", "理工学部"], ["慶應義塾大学", "総合政策学部"], ["慶應義塾大学", "環境情報学部"], ["慶應義塾大学", "看護医療学部"], ["慶應義塾大学", "薬学部"]]
university_department_relationships.each do |r|
  u = University.find_by_name(r[0])
  d = Department.find_by_name(r[1])
  unless UniversityDepartmentRelationship.exist(u, d)
    UniversityDepartmentRelationship.create(:university_id => u.id, :department_id => d.id)
  end
end

SkillCategory.create(:name => "プログラミング");
SkillCategory.create(:name => "デザイン");
SkillCategory.create(:name => "マネジメント");

languages = ["C", "C++", "C#", "Java", "Objective-C", "PHP", "Python", "Perl", "Ruby", "JavaScript", "SQL"]
sk_p = SkillCategory.find_by_name("プログラミング")
languages.each do |l|
  Skill.create(:name => l, :skill_category_id => sk_p.id)
end
