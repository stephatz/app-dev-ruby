class JobsController < ApplicationController
  def index
    matching_jobs = current_user.jobs

    @list_of_jobs = matching_jobs.order({ :created_at => :desc })

    render({ :template => "jobs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    @the_interviews = @the_job.interviews.all

    render({ :template => "jobs/show" })
  end

  def create
    the_job = Job.new
    the_job.job_title = params.fetch("query_job_title")
    the_job.user_id = current_user.id
    the_job.responsibilities = params.fetch("query_responsibilities")
    the_job.employer = params.fetch("query_employer")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.job_title = params.fetch("query_job_title")
    the_job.responsibilities = params.fetch("query_responsibilities")
    the_job.employer = params.fetch("query_employer")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully."} )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.destroy

    redirect_to("/jobs", { :notice => "Job deleted successfully."} )
  end
end
