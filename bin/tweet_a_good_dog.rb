require "./lib/good_dogs.rb"

class TweetAGoodDog
  def run
    good_dog = random_good_dog
    Tweet.post(tweet_text(good_dog))
    good_dog.mark_as_tweeted!
  end

  private

  def random_good_dog
    pick_good_dog(random_good_dog_id)
  end

  def random_good_dog_id
    rand(GoodDog.where(tweeted: false).maximum(:id)) + 1
  end

  def pick_good_dog(id)
    GoodDog.where(tweeted: false).where("id >= ?", id).first
  end

  def tweet_text(good_dog)
    Text::Generator.new(subjects: { dog: good_dog }).generate
  end
end

FREQUENCY_DENOMINATOR = ARGV[0].nil? ? 1 : ARGV[0].to_i

if rand(FREQUENCY_DENOMINATOR).zero?
  TweetAGoodDog.new.run
end
