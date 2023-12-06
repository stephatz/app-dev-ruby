class InterviewsController < ApplicationController
  def index
    matching_interviews = current_user.interviews
    
    
    @list_of_interviews = matching_interviews.order({ :created_at => :desc })

    render({ :template => "interviews/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interviews = Interview.where({ :id => the_id })

    @the_interview = matching_interviews.at(0)

    @the_questions = @the_interview.questions.all

    render({ :template => "interviews/show" })
  end

  def create
    the_interview = Interview.new
    the_interview.job_id = params.fetch("query_job_id")
    the_interview.date = params.fetch("query_date")
    the_interview.interview_type = params.fetch("query_type")

    if the_interview.valid?
      the_interview.save
      redirect_to("/jobs/#{the_interview.job.id}", { :notice => "Interview created successfully." })
    else
      redirect_to("/jobs/#{the_interview.job.id}", { :alert => the_interview.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interview = Interview.where({ :id => the_id }).at(0)

    the_interview.date = params.fetch("query_date")
    the_interview.interview_type = params.fetch("query_type")

    if the_interview.valid?
      the_interview.save
      redirect_to("/interviews/#{the_interview.id}", { :notice => "Interview updated successfully."} )
    else
      redirect_to("/interviews/#{the_interview.id}", { :alert => the_interview.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interview = Interview.where({ :id => the_id }).at(0)

    the_interview.destroy

    redirect_to("/jobs/#{the_interview.job.id}", { :notice => "Interview deleted successfully."} )
  end
end
