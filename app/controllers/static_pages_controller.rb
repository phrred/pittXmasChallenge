
class StaticPagesController < ApplicationController
  def home
    @totalCount = Comment.count
    pitt_bros = Comment.joins(:user).where(users: {gender:true, campus:"PITT", staff: false}).all
    pitt_sis = Comment.joins(:user).where(users: {gender:false, campus:"PITT", staff: false}).all
    pitt_staff = Comment.joins(:user).where(users: {campus:"PITT", staff: true}).all
    cmu_bros = Comment.joins(:user).where(users: {gender:true, campus:"CMU", staff: false}).all
    cmu_sis = Comment.joins(:user).where(users: {gender:false, campus:"CMU", staff: false}).all
    cmu_staff = Comment.joins(:user).where(users: {campus:"CMU", staff: true}).all
    @pitt_bros_sum = 0;
    @pitt_sis_sum = 0;
    @pitt_staff_sum = 0;
    @cmu_bros_sum = 0;
    @cmu_sis_sum = 0;
    @cmu_staff_sum = 0;

    pitt_bros.each do |post|
      @pitt_bros_sum += post.mission.points
    end

    pitt_sis.each do |post|
      @pitt_sis_sum += post.mission.points
    end

    pitt_staff.each do |post|
      @pitt_staff_sum += post.mission.points
    end

    cmu_bros.each do |post|
      @cmu_bros_sum += post.mission.points
    end

    cmu_sis.each do |post|
      @cmu_sis_sum += post.mission.points
    end

    cmu_staff.each do |post|
      @cmu_staff_sum += post.mission.points
    end


    @points = [['PITT Bros', @pitt_bros_sum], ['PITT Sis', @pitt_sis_sum], ['PITT Staff', @pitt_staff_sum], ['CMU Bros', @cmu_bros_sum], ['CMU Sis', @cmu_sis_sum], ['CMU Staff', @cmu_staff_sum]].sort do |a, b|
      b[1] <=> a[1]
    end

    @winner = @points.delete_at(0)

    @comment = Comment.new
    @comments = Comment.where.not(:mission_id => Mission.where(:name => "Completed Thanksgiving Challenge").first.id).page(params[:page]).order('created_at DESC')

    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    bonus_category = Category.where(:mission_type => "Bonus").first
    @bonus = nil
    if !bonus_category.nil?
      @bonus = Mission.where(:category_id => bonus_category.id).first  
    end
  end

  def challenges
    @comment = Comment.new
    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    bonus_category = Category.where(:mission_type => "Bonus").first
    @bonus = nil
    if !bonus_category.nil?
      @bonus = Mission.where(:category_id => bonus_category.id).first  
    end
  end

  def stats
    #@one = ['Kevan', 'Jon Kim', 'Will', 'Alex', 'Josh Joo', 'Kevin Stock', 'Daniel Liu', 'Godwin Law', 'Jonathan Chen']
    #@two = ['Jenny', 'Kat Kim', 'Alex', 'Adeline', 'Huizhen', 'Dasol', 'Vivian L', 'Jennifer Li', 'Stella Oh', 'Michelle Kim', 'Vanessa', 'Mira Chiu', 'Katherine Cai']
    #@three = ['Joe', 'Brian Jue', 'Ivan Yung', 'Jeff W', 'Nathan M', 'Andrew N.', 'Josh Kim', 'David Lee', 'Daniel Shan', 'Matt Estrada', 'Ben VDH', 'Noah Kang']
    #@four = ['Irene', 'Ellen Jue', 'San Yung', 'Joyce Cho', 'Joyce Han', 'Nancy P.', 'Claire Lee', 'Kristy J', 'Grace Park', 'Yvonne W', 'Micaela W']

    pitt_bros = Comment.joins(:user).where(users: {gender:true, campus:"PITT", staff: false}).all
    pitt_sis = Comment.joins(:user).where(users: {gender:false, campus:"PITT", staff: false}).all
    pitt_staff = Comment.joins(:user).where(users: {campus:"PITT", staff: true}).all
    cmu_bros = Comment.joins(:user).where(users: {gender:true, campus:"CMU", staff: false}).all
    cmu_sis = Comment.joins(:user).where(users: {gender:false, campus:"CMU", staff: false}).all
    cmu_staff = Comment.joins(:user).where(users: {campus:"CMU", staff: true}).all
    @pitt_bros_sum = 0;
    @pitt_sis_sum = 0;
    @pitt_staff_sum = 0;
    @cmu_bros_sum = 0;
    @cmu_sis_sum = 0;
    @cmu_staff_sum = 0;

    pitt_bros.each do |post|
      @pitt_bros_sum += post.mission.points
    end

    pitt_sis.each do |post|
      @pitt_sis_sum += post.mission.points
    end

    pitt_staff.each do |post|
      @pitt_staff_sum += post.mission.points
    end

    cmu_bros.each do |post|
      @cmu_bros_sum += post.mission.points
    end

    cmu_sis.each do |post|
      @cmu_sis_sum += post.mission.points
    end

    cmu_staff.each do |post|
      @cmu_staff_sum += post.mission.points
    end


    @points = [['PITT Bros', @pitt_bros_sum], ['PITT Sis', @pitt_sis_sum], ['PITT Staff', @pitt_staff_sum], ['CMU Bros', @cmu_bros_sum], ['CMU Sis', @cmu_sis_sum], ['CMU Staff', @cmu_staff_sum]].sort do |a, b|
      b[1] <=> a[1]
    end

    # @points = [[team, pointSum],...]

    @winner = @points.delete_at(0)

  end

  def completed
    @comment = Comment.new
    @comments = Comment.where.not(:mission_id => Mission.where(:name => "Completed Thanksgiving Challenge").first.id).page(params[:page]).order('created_at DESC')
    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    bonus_category = Category.where(:mission_type => "Bonus").first
    @bonus = nil
    if !bonus_category.nil?
      @bonus = Mission.where(:category_id => bonus_category.id).first  
    end
  end

  def powerranking
    names = Comment.uniq.pluck(:name)
  end

end
