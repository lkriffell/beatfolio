class FeedsController < ApplicationController
  def show
    @beats = nil
    if current_user
      @beats = current_user.beats
      current_user.following.each do |user_follow|
        user_follow.user.beats.each do |beat|
        @beats << beat
        end
      end
    else
      @beats = Beat.all
    end
    @beats.sort_by { |beat| beat.created_at }
  end
end