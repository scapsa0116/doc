class Document < ApplicationRecord
    belongs_to :user
    belongs_to :category

    scope :alpha, -> { order(:responsavel) }
    # scope :most_reviews, -> {left_joins(:reviews).group('jobs.id').order('count(reviews.job_id) desc')}
end