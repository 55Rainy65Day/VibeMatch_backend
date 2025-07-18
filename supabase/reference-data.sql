-- Reference data for VibesMatch
-- This file populates all the lookup/reference tables with standard options

-- Gender options
INSERT INTO genders (code, name) VALUES
('male', 'Male'),
('female', 'Female'),
('non-binary', 'Non-binary'),
('genderfluid', 'Genderfluid'),
('agender', 'Agender'),
('other', 'Other');

-- MBTI Personality Types
INSERT INTO personality_types (code, name, description, category) VALUES
-- Analysts
('INTJ', 'The Architect', 'Imaginative and strategic thinkers, with a plan for everything.', 'Analyst'),
('INTP', 'The Thinker', 'Innovative inventors with an unquenchable thirst for knowledge.', 'Analyst'),
('ENTJ', 'The Commander', 'Bold, imaginative and strong-willed leaders, always finding a way – or making one.', 'Analyst'),
('ENTP', 'The Debater', 'Smart and curious thinkers who cannot resist an intellectual challenge.', 'Analyst'),
-- Diplomats
('INFJ', 'The Advocate', 'Creative and insightful, inspired and independent perfectionists.', 'Diplomat'),
('INFP', 'The Mediator', 'Poetic, kind and altruistic people, always eager to help a good cause.', 'Diplomat'),
('ENFJ', 'The Protagonist', 'Charismatic and inspiring leaders, able to mesmerize their listeners.', 'Diplomat'),
('ENFP', 'The Campaigner', 'Enthusiastic, creative and sociable free spirits, who can always find a reason to smile.', 'Diplomat'),
-- Sentinels
('ISTJ', 'The Logistician', 'Practical and fact-minded, reliable and responsible.', 'Sentinel'),
('ISFJ', 'The Protector', 'Warm-hearted and dedicated, always ready to protect their loved ones.', 'Sentinel'),
('ESTJ', 'The Executive', 'Excellent administrators, unsurpassed at managing things – or people.', 'Sentinel'),
('ESFJ', 'The Consul', 'Extraordinarily caring, social and popular people, always eager to help.', 'Sentinel'),
-- Explorers
('ISTP', 'The Virtuoso', 'Bold and practical experimenters, masters of all kinds of tools.', 'Explorer'),
('ISFP', 'The Adventurer', 'Flexible and charming artists, always ready to explore new possibilities.', 'Explorer'),
('ESTP', 'The Entrepreneur', 'Smart, energetic and very perceptive people, truly enjoy living on the edge.', 'Explorer'),
('ESFP', 'The Entertainer', 'Spontaneous, energetic and enthusiastic people – life is never boring around them.', 'Explorer');

-- Interest Categories
INSERT INTO interest_categories (name, emoji, sort_order) VALUES
('Sports & Fitness', '🏃‍♂️', 1),
('Arts & Culture', '🎨', 2),
('Food & Drink', '🍽️', 3),
('Travel & Adventure', '✈️', 4),
('Technology', '💻', 5),
('Lifestyle', '🌱', 6),
('Social', '🎉', 7),
('Learning', '📚', 8),
('Hobbies', '🎯', 9),
('Pets & Animals', '🐕', 10);

-- Interests (getting category IDs first)
WITH categories AS (
  SELECT id, name FROM interest_categories
)
INSERT INTO interests (name, category_id, emoji, sort_order)
SELECT interest_name, cat.id, interest_emoji, interest_order
FROM (VALUES
  -- Sports & Fitness
  ('Running', 'Sports & Fitness', '🏃', 1),
  ('Gym', 'Sports & Fitness', '💪', 2),
  ('Yoga', 'Sports & Fitness', '🧘', 3),
  ('Swimming', 'Sports & Fitness', '🏊', 4),
  ('Cycling', 'Sports & Fitness', '🚴', 5),
  ('Hiking', 'Sports & Fitness', '🥾', 6),
  ('Dancing', 'Sports & Fitness', '💃', 7),
  ('Tennis', 'Sports & Fitness', '🎾', 8),
  ('Basketball', 'Sports & Fitness', '🏀', 9),
  ('Football', 'Sports & Fitness', '⚽', 10),
  -- Arts & Culture
  ('Music', 'Arts & Culture', '🎵', 1),
  ('Movies', 'Arts & Culture', '🎬', 2),
  ('Reading', 'Arts & Culture', '📖', 3),
  ('Photography', 'Arts & Culture', '📸', 4),
  ('Painting', 'Arts & Culture', '🎨', 5),
  ('Theater', 'Arts & Culture', '🎭', 6),
  ('Museums', 'Arts & Culture', '🏛️', 7),
  ('Concerts', 'Arts & Culture', '🎤', 8),
  ('Art Galleries', 'Arts & Culture', '🖼️', 9),
  ('Writing', 'Arts & Culture', '✍️', 10),
  -- Food & Drink
  ('Cooking', 'Food & Drink', '👨‍🍳', 1),
  ('Wine Tasting', 'Food & Drink', '🍷', 2),
  ('Coffee', 'Food & Drink', '☕', 3),
  ('Restaurants', 'Food & Drink', '🍽️', 4),
  ('Baking', 'Food & Drink', '🧁', 5),
  ('Craft Beer', 'Food & Drink', '🍺', 6),
  ('Vegetarian', 'Food & Drink', '🥗', 7),
  ('Vegan', 'Food & Drink', '🌱', 8),
  ('Food Trucks', 'Food & Drink', '🚚', 9),
  ('Fine Dining', 'Food & Drink', '🥂', 10),
  -- Travel & Adventure
  ('Travel', 'Travel & Adventure', '🌍', 1),
  ('Backpacking', 'Travel & Adventure', '🎒', 2),
  ('Road Trips', 'Travel & Adventure', '🚗', 3),
  ('Beach', 'Travel & Adventure', '🏖️', 4),
  ('Mountains', 'Travel & Adventure', '⛰️', 5),
  ('Camping', 'Travel & Adventure', '🏕️', 6),
  ('Adventure Sports', 'Travel & Adventure', '🪂', 7),
  ('Exploring', 'Travel & Adventure', '🗺️', 8),
  ('City Breaks', 'Travel & Adventure', '🏙️', 9),
  ('Culture', 'Travel & Adventure', '🏛️', 10),
  -- Technology
  ('Gaming', 'Technology', '🎮', 1),
  ('Tech', 'Technology', '💻', 2),
  ('Programming', 'Technology', '👨‍💻', 3),
  ('Gadgets', 'Technology', '📱', 4),
  ('AI', 'Technology', '🤖', 5),
  ('Startups', 'Technology', '🚀', 6),
  ('Innovation', 'Technology', '💡', 7),
  ('Apps', 'Technology', '📲', 8),
  ('Social Media', 'Technology', '📱', 9),
  ('Crypto', 'Technology', '₿', 10),
  -- Lifestyle
  ('Fashion', 'Lifestyle', '👗', 1),
  ('Shopping', 'Lifestyle', '🛍️', 2),
  ('Meditation', 'Lifestyle', '🧘‍♀️', 3),
  ('Wellness', 'Lifestyle', '🌿', 4),
  ('Spirituality', 'Lifestyle', '🕯️', 5),
  ('Volunteering', 'Lifestyle', '🤝', 6),
  ('Environment', 'Lifestyle', '🌍', 7),
  ('Sustainability', 'Lifestyle', '♻️', 8),
  ('Minimalism', 'Lifestyle', '✨', 9),
  ('Self-Care', 'Lifestyle', '💆‍♀️', 10),
  -- Social
  ('Parties', 'Social', '🎉', 1),
  ('Nightlife', 'Social', '🌃', 2),
  ('Bars', 'Social', '🍻', 3),
  ('Clubs', 'Social', '🕺', 4),
  ('Festivals', 'Social', '🎪', 5),
  ('Networking', 'Social', '🤝', 6),
  ('Meetups', 'Social', '👥', 7),
  ('Friends', 'Social', '👫', 8),
  ('Family', 'Social', '👨‍👩‍👧‍👦', 9),
  ('Community', 'Social', '🏘️', 10),
  -- Learning
  ('Languages', 'Learning', '🗣️', 1),
  ('History', 'Learning', '📜', 2),
  ('Science', 'Learning', '🔬', 3),
  ('Philosophy', 'Learning', '🤔', 4),
  ('Psychology', 'Learning', '🧠', 5),
  ('Business', 'Learning', '💼', 6),
  ('Investing', 'Learning', '📈', 7),
  ('Podcasts', 'Learning', '🎧', 8),
  ('Documentaries', 'Learning', '📺', 9),
  ('Online Courses', 'Learning', '💻', 10),
  -- Hobbies
  ('Gardening', 'Hobbies', '🌱', 1),
  ('DIY', 'Hobbies', '🔨', 2),
  ('Crafts', 'Hobbies', '✂️', 3),
  ('Board Games', 'Hobbies', '🎲', 4),
  ('Puzzles', 'Hobbies', '🧩', 5),
  ('Collecting', 'Hobbies', '🏺', 6),
  ('Astronomy', 'Hobbies', '🔭', 7),
  ('Magic', 'Hobbies', '🎩', 8),
  ('Karaoke', 'Hobbies', '🎤', 9),
  ('Trivia', 'Hobbies', '🧠', 10),
  -- Pets & Animals
  ('Dogs', 'Pets & Animals', '🐕', 1),
  ('Cats', 'Pets & Animals', '🐱', 2),
  ('Pets', 'Pets & Animals', '🐾', 3),
  ('Animal Welfare', 'Pets & Animals', '❤️', 4),
  ('Veterinary', 'Pets & Animals', '🩺', 5),
  ('Wildlife', 'Pets & Animals', '🦁', 6),
  ('Zoos', 'Pets & Animals', '🦒', 7),
  ('Aquariums', 'Pets & Animals', '🐠', 8),
  ('Pet Training', 'Pets & Animals', '🎾', 9),
  ('Animal Photography', 'Pets & Animals', '📸', 10)
) AS interests_data(interest_name, category_name, interest_emoji, interest_order)
JOIN categories cat ON cat.name = interests_data.category_name;

-- Exercise Levels
INSERT INTO exercise_levels (code, name, sort_order) VALUES
('never', 'Never', 1),
('rarely', 'Rarely', 2),
('sometimes', 'Sometimes', 3),
('often', 'Often', 4),
('everyday', 'Every day', 5);

-- Education Levels
INSERT INTO education_levels (code, name, sort_order) VALUES
('high_school', 'High School', 1),
('some_college', 'Some College', 2),
('bachelors', 'Bachelor''s Degree', 3),
('masters', 'Master''s Degree', 4),
('phd', 'PhD', 5),
('trade_school', 'Trade School', 6),
('other', 'Other', 7);

-- Job Types
INSERT INTO job_types (code, name, sort_order) VALUES
('student', 'Student', 1),
('technology', 'Technology', 2),
('healthcare', 'Healthcare', 3),
('education', 'Education', 4),
('finance', 'Finance', 5),
('marketing', 'Marketing', 6),
('sales', 'Sales', 7),
('creative', 'Creative/Arts', 8),
('business', 'Business', 9),
('legal', 'Legal', 10),
('engineering', 'Engineering', 11),
('hospitality', 'Hospitality', 12),
('retail', 'Retail', 13),
('construction', 'Construction', 14),
('government', 'Government', 15),
('nonprofit', 'Non-profit', 16),
('entrepreneur', 'Entrepreneur', 17),
('freelance', 'Freelance', 18),
('retired', 'Retired', 19),
('unemployed', 'Unemployed', 20),
('other', 'Other', 21);

-- Drinking Habits
INSERT INTO drinking_habits (code, name, sort_order) VALUES
('never', 'Never', 1),
('rarely', 'Rarely', 2),
('socially', 'Socially', 3),
('regularly', 'Regularly', 4),
('prefer_not_to_say', 'Prefer not to say', 5);

-- Smoking Habits
INSERT INTO smoking_habits (code, name, sort_order) VALUES
('never', 'Never', 1),
('socially', 'Socially', 2),
('regularly', 'Regularly', 3),
('trying_to_quit', 'Trying to quit', 4),
('prefer_not_to_say', 'Prefer not to say', 5);

-- Kids Preferences
INSERT INTO kids_preferences (code, name, sort_order) VALUES
('want_kids', 'Want kids', 1),
('have_kids', 'Have kids', 2),
('dont_want_kids', 'Don''t want kids', 3),
('open_to_kids', 'Open to kids', 4),
('prefer_not_to_say', 'Prefer not to say', 5);

-- Ethnicities
INSERT INTO ethnicities (code, name, sort_order) VALUES
('asian', 'Asian', 1),
('black', 'Black/African American', 2),
('hispanic', 'Hispanic/Latino', 3),
('white', 'White/Caucasian', 4),
('middle_eastern', 'Middle Eastern', 5),
('native_american', 'Native American', 6),
('pacific_islander', 'Pacific Islander', 7),
('mixed', 'Mixed/Multiracial', 8),
('other', 'Other', 9),
('prefer_not_to_say', 'Prefer not to say', 10);

-- Religions
INSERT INTO religions (code, name, sort_order) VALUES
('christian', 'Christian', 1),
('muslim', 'Muslim', 2),
('jewish', 'Jewish', 3),
('hindu', 'Hindu', 4),
('buddhist', 'Buddhist', 5),
('sikh', 'Sikh', 6),
('atheist', 'Atheist', 7),
('agnostic', 'Agnostic', 8),
('spiritual', 'Spiritual', 9),
('other', 'Other', 10),
('prefer_not_to_say', 'Prefer not to say', 11);

-- Relationship Types
INSERT INTO relationship_types (code, name, sort_order) VALUES
('serious', 'Serious relationship', 1),
('casual', 'Casual dating', 2),
('friends', 'Friends', 3),
('hookups', 'Hookups', 4),
('open_to_all', 'Open to all', 5);

-- Relationship Statuses
INSERT INTO relationship_statuses (code, name, sort_order) VALUES
('single', 'Single', 1),
('divorced', 'Divorced', 2),
('separated', 'Separated', 3),
('widowed', 'Widowed', 4),
('its_complicated', 'It''s complicated', 5);

-- Sexualities
INSERT INTO sexualities (code, name, sort_order) VALUES
('straight', 'Straight', 1),
('gay', 'Gay', 2),
('lesbian', 'Lesbian', 3),
('bisexual', 'Bisexual', 4),
('pansexual', 'Pansexual', 5),
('asexual', 'Asexual', 6),
('demisexual', 'Demisexual', 7),
('queer', 'Queer', 8),
('questioning', 'Questioning', 9),
('other', 'Other', 10);

-- Looking For Options
INSERT INTO looking_for_options (code, name, sort_order) VALUES
('dating', 'Dating', 1),
('friends', 'Friends', 2),
('networking', 'Networking', 3),
('activity_partner', 'Activity Partner', 4),
('travel_buddy', 'Travel Buddy', 5);