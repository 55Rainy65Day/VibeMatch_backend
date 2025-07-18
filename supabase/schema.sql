-- VibesMatch Database Schema
-- This file contains all the database tables and policies for the VibesMatch dating app

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create ENUM types for better type safety and performance
CREATE TYPE continent_type AS ENUM ('Africa', 'Antarctica', 'Asia', 'Europe', 'North America', 'Oceania', 'South America');
CREATE TYPE match_request_type AS ENUM ('like', 'super_like', 'direct_message');
CREATE TYPE match_request_status AS ENUM ('pending', 'accepted', 'declined', 'cancelled');
CREATE TYPE message_type AS ENUM ('text', 'image', 'voice', 'video', 'gif', 'sticker', 'location', 'file');
CREATE TYPE processing_status AS ENUM ('pending', 'processing', 'completed', 'failed');
CREATE TYPE notification_type AS ENUM ('match', 'message', 'request', 'view');
CREATE TYPE report_type AS ENUM ('inappropriate_content', 'harassment', 'fake_profile', 'spam', 'underage', 'violence', 'hate_speech', 'nudity', 'scam', 'other');
CREATE TYPE report_status AS ENUM ('pending', 'under_review', 'resolved', 'dismissed');
CREATE TYPE admin_role AS ENUM ('super_admin', 'admin', 'moderator');
CREATE TYPE moderation_action_type AS ENUM ('warning', 'temporary_ban', 'permanent_ban', 'profile_review', 'content_removal', 'account_verification');
CREATE TYPE ban_type AS ENUM ('temporary', 'permanent');
CREATE TYPE payment_type AS ENUM ('super_likes', 'premium');
CREATE TYPE payment_status AS ENUM ('pending', 'completed', 'failed', 'refunded');
CREATE TYPE user_action AS ENUM ('like', 'dislike', 'super_like', 'message');

-- Countries table - All world countries with codes and continents
CREATE TABLE countries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(2) UNIQUE NOT NULL, -- ISO 3166-1 alpha-2 code (US, GB, etc.)
  code3 VARCHAR(3) UNIQUE NOT NULL, -- ISO 3166-1 alpha-3 code (USA, GBR, etc.)
  name VARCHAR NOT NULL,
  continent continent_type NOT NULL,
  region VARCHAR,
  capital VARCHAR,
  currency_code VARCHAR(3),
  phone_code VARCHAR,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Gender options table
CREATE TABLE genders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL, -- 'male', 'female', 'non-binary', etc.
  name VARCHAR NOT NULL, -- Display name
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- MBTI personality types table
CREATE TABLE personality_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(4) UNIQUE NOT NULL, -- 'INTJ', 'ENFP', etc.
  name VARCHAR NOT NULL, -- 'The Architect', 'The Campaigner', etc.
  description TEXT,
  category VARCHAR NOT NULL, -- 'Analyst', 'Diplomat', 'Sentinel', 'Explorer'
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Interest categories table
CREATE TABLE interest_categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR NOT NULL UNIQUE,
  emoji VARCHAR(10),
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Interests table
CREATE TABLE interests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR NOT NULL,
  category_id UUID REFERENCES interest_categories(id) NOT NULL,
  emoji VARCHAR(10),
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(name, category_id)
);

-- Lifestyle options tables
CREATE TABLE exercise_levels (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE education_levels (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE job_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(30) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE drinking_habits (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE smoking_habits (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE kids_preferences (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE ethnicities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(30) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE religions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(30) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Relationship and preference tables
CREATE TABLE relationship_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE relationship_statuses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE sexualities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE looking_for_options (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Users table - Core user information
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR UNIQUE NOT NULL,
  name VARCHAR NOT NULL,
  bio TEXT,
  age INTEGER NOT NULL CHECK (age >= 18 AND age <= 100),
  gender_id UUID REFERENCES genders(id) NOT NULL,
  country_id UUID REFERENCES countries(id) NOT NULL,
  state VARCHAR,
  city VARCHAR,
  -- Geolocation for distance-based matching
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION,
  location_updated_at TIMESTAMPTZ,
  show_distance BOOLEAN DEFAULT TRUE, -- Privacy setting for showing distance
  -- Lifestyle references
  exercise_level_id UUID REFERENCES exercise_levels(id),
  education_level_id UUID REFERENCES education_levels(id),
  job_type_id UUID REFERENCES job_types(id),
  drinking_habit_id UUID REFERENCES drinking_habits(id),
  smoking_habit_id UUID REFERENCES smoking_habits(id),
  kids_preference_id UUID REFERENCES kids_preferences(id),
  ethnicity_id UUID REFERENCES ethnicities(id),
  religion_id UUID REFERENCES religions(id),
  -- Relationship preferences
  relationship_type_id UUID REFERENCES relationship_types(id),
  relationship_status_id UUID REFERENCES relationship_statuses(id),
  sexuality_id UUID REFERENCES sexualities(id),
  personality_type_id UUID REFERENCES personality_types(id),
  age_range_min INTEGER DEFAULT 18 CHECK (age_range_min >= 18),
  age_range_max INTEGER DEFAULT 100 CHECK (age_range_max <= 100),
  -- Settings (keeping as JSONB for flexibility)
  settings JSONB DEFAULT '{}',
  is_premium BOOLEAN DEFAULT FALSE,
  premium_expires_at TIMESTAMPTZ,
  super_likes_count INTEGER DEFAULT 0 CHECK (super_likes_count >= 0),
  daily_likes_count INTEGER DEFAULT 0 CHECK (daily_likes_count >= 0),
  daily_likes_reset_at TIMESTAMPTZ DEFAULT NOW(),
  last_active TIMESTAMPTZ DEFAULT NOW(),
  allow_search BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  CHECK (age_range_min <= age_range_max)
);

-- User interests junction table (many-to-many)
CREATE TABLE user_interests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  interest_id UUID REFERENCES interests(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, interest_id)
);

-- User looking for options junction table (many-to-many)
CREATE TABLE user_looking_for (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  looking_for_id UUID REFERENCES looking_for_options(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, looking_for_id)
);

-- User preferred genders junction table (many-to-many)
CREATE TABLE user_preferred_genders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  gender_id UUID REFERENCES genders(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, gender_id)
);

-- Photos table - User profile photos
CREATE TABLE photos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  url TEXT NOT NULL, -- Changed to TEXT for better URL handling
  position INTEGER NOT NULL CHECK (position >= 1 AND position <= 6),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, position)
);

-- Match requests table - All user interactions (likes, super likes, messages)
CREATE TABLE match_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sender_id UUID REFERENCES users(id) ON DELETE CASCADE,
  receiver_id UUID REFERENCES users(id) ON DELETE CASCADE,
  type match_request_type NOT NULL,
  message TEXT,
  status match_request_status DEFAULT 'pending',
  super_like_priority_expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(sender_id, receiver_id),
  CHECK (
    (type = 'direct_message' AND message IS NOT NULL) OR 
    (type IN ('like', 'super_like'))
  )
);

-- Matches table - Successful matches between users
CREATE TABLE matches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user1_id UUID REFERENCES users(id) ON DELETE CASCADE,
  user2_id UUID REFERENCES users(id) ON DELETE CASCADE,
  created_from_request_id UUID REFERENCES match_requests(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user1_id, user2_id),
  CHECK (user1_id < user2_id) -- Ensure consistent ordering
);

-- Chat rooms table - Chat sessions between matched users
CREATE TABLE chat_rooms (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  match_id UUID REFERENCES matches(id) ON DELETE CASCADE UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Messages table - Chat messages with enhanced media support
CREATE TABLE messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  chat_room_id UUID REFERENCES chat_rooms(id) ON DELETE CASCADE,
  sender_id UUID REFERENCES users(id) ON DELETE CASCADE,
  content TEXT, -- Optional for media messages
  type message_type DEFAULT 'text',
  media_url TEXT, -- Changed to TEXT for better URL handling
  media_thumbnail_url TEXT, -- Changed to TEXT for better URL handling
  media_duration INTEGER, -- Duration in seconds for voice/video
  media_size INTEGER, -- File size in bytes
  media_mime_type VARCHAR, -- MIME type of the media
  read_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  CHECK (
    (type = 'text' AND content IS NOT NULL) OR
    (type != 'text' AND media_url IS NOT NULL)
  )
);

-- Media attachments table - For storing media metadata and processing status
CREATE TABLE media_attachments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  message_id UUID REFERENCES messages(id) ON DELETE CASCADE,
  original_filename VARCHAR,
  file_path TEXT NOT NULL, -- Changed to TEXT for better path handling
  file_size INTEGER NOT NULL,
  mime_type VARCHAR NOT NULL,
  width INTEGER, -- For images/videos
  height INTEGER, -- For images/videos
  duration INTEGER, -- For audio/video in seconds
  thumbnail_path TEXT, -- Changed to TEXT for better path handling
  processing_status processing_status DEFAULT 'pending',
  metadata JSONB DEFAULT '{}', -- Additional metadata (EXIF, etc.)
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Profile views table - Track who viewed whose profile
CREATE TABLE profile_views (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  viewer_id UUID REFERENCES users(id) ON DELETE CASCADE,
  viewed_id UUID REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(viewer_id, viewed_id, DATE(created_at)),
  CHECK (viewer_id != viewed_id)
);

-- User interactions table - Track all user actions to prevent re-showing profiles
CREATE TABLE user_interactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  target_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  action user_action NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, target_user_id),
  CHECK (user_id != target_user_id)
);

-- User blocks table - Separate table for blocking functionality with privacy logic
CREATE TABLE user_blocks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  blocker_id UUID REFERENCES users(id) ON DELETE CASCADE,
  blocked_id UUID REFERENCES users(id) ON DELETE CASCADE,
  reason VARCHAR, -- Optional reason for blocking
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(blocker_id, blocked_id),
  CHECK (blocker_id != blocked_id)
);

-- Notifications table - In-app notifications
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  type notification_type NOT NULL,
  title VARCHAR NOT NULL,
  body VARCHAR NOT NULL,
  data JSONB DEFAULT '{}',
  read_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Reports table - User reports for moderation
CREATE TABLE reports (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  reporter_id UUID REFERENCES users(id) ON DELETE CASCADE,
  reported_id UUID REFERENCES users(id) ON DELETE CASCADE,
  report_type report_type NOT NULL,
  reason VARCHAR NOT NULL, -- User-provided reason
  description TEXT, -- Additional details
  evidence_urls TEXT[], -- Array of URLs to screenshots/evidence
  status report_status DEFAULT 'pending',
  admin_notes TEXT, -- Internal admin notes
  admin_id UUID, -- Admin who handled the report
  resolved_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  CHECK (reporter_id != reported_id)
);

-- Admin users table - For moderation and admin access
CREATE TABLE admin_users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE UNIQUE,
  role admin_role NOT NULL,
  permissions JSONB DEFAULT '{}', -- Specific permissions
  created_by UUID REFERENCES admin_users(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Moderation actions table - Track all moderation actions
CREATE TABLE moderation_actions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  admin_id UUID REFERENCES admin_users(id) NOT NULL,
  target_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  action_type moderation_action_type NOT NULL,
  reason TEXT NOT NULL,
  duration_hours INTEGER, -- For temporary bans
  expires_at TIMESTAMPTZ, -- When the action expires
  metadata JSONB DEFAULT '{}', -- Additional action data
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- User bans table - Track banned users
CREATE TABLE user_bans (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  ban_type ban_type NOT NULL,
  reason TEXT NOT NULL,
  banned_by UUID REFERENCES admin_users(id) NOT NULL,
  expires_at TIMESTAMPTZ, -- NULL for permanent bans
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Payments table - Track Super Like purchases and Premium subscriptions
CREATE TABLE payments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  type payment_type NOT NULL,
  amount INTEGER NOT NULL, -- Amount in cents
  currency VARCHAR DEFAULT 'USD',
  stripe_payment_intent_id VARCHAR,
  status payment_status DEFAULT 'pending',
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX idx_users_last_active ON users(last_active DESC);
CREATE INDEX idx_users_location ON users(country_id, state, city);
CREATE INDEX idx_countries_code ON countries(code);
CREATE INDEX idx_countries_continent ON countries(continent);
CREATE INDEX idx_users_age_gender ON users(age, gender_id);
CREATE INDEX idx_users_personality ON users(personality_type_id);
CREATE INDEX idx_users_lifestyle ON users(exercise_level_id, education_level_id, job_type_id);
CREATE INDEX idx_users_preferences ON users(relationship_type_id, sexuality_id);

-- Indexes for reference tables
CREATE INDEX idx_interests_category ON interests(category_id);
CREATE INDEX idx_user_interests_user ON user_interests(user_id);
CREATE INDEX idx_user_interests_interest ON user_interests(interest_id);
CREATE INDEX idx_user_looking_for_user ON user_looking_for(user_id);
CREATE INDEX idx_user_preferred_genders_user ON user_preferred_genders(user_id);
CREATE INDEX idx_users_premium ON users(is_premium, premium_expires_at);

CREATE INDEX idx_photos_user_position ON photos(user_id, position);

CREATE INDEX idx_match_requests_receiver ON match_requests(receiver_id, created_at DESC);
CREATE INDEX idx_match_requests_sender ON match_requests(sender_id, created_at DESC);
CREATE INDEX idx_match_requests_status ON match_requests(status);
CREATE INDEX idx_match_requests_priority ON match_requests(super_like_priority_expires_at) WHERE super_like_priority_expires_at IS NOT NULL;

CREATE INDEX idx_matches_users ON matches(user1_id, user2_id);
CREATE INDEX idx_matches_created ON matches(created_at DESC);

CREATE INDEX idx_messages_chat_room ON messages(chat_room_id, created_at DESC);
CREATE INDEX idx_messages_sender ON messages(sender_id);

CREATE INDEX idx_profile_views_viewer ON profile_views(viewer_id, created_at DESC);
CREATE INDEX idx_profile_views_viewed ON profile_views(viewed_id, created_at DESC);

CREATE INDEX idx_user_interactions_user ON user_interactions(user_id);
CREATE INDEX idx_user_interactions_target ON user_interactions(target_user_id);

CREATE INDEX idx_notifications_user ON notifications(user_id, created_at DESC);
CREATE INDEX idx_notifications_unread ON notifications(user_id, read_at) WHERE read_at IS NULL;

-- Indexes for new tables
CREATE INDEX idx_users_geolocation ON users(latitude, longitude) WHERE latitude IS NOT NULL AND longitude IS NOT NULL;
CREATE INDEX idx_user_blocks_blocker ON user_blocks(blocker_id);
CREATE INDEX idx_user_blocks_blocked ON user_blocks(blocked_id);
CREATE INDEX idx_media_attachments_user ON media_attachments(user_id);
CREATE INDEX idx_media_attachments_message ON media_attachments(message_id);
CREATE INDEX idx_media_attachments_status ON media_attachments(processing_status);
CREATE INDEX idx_reports_reporter ON reports(reporter_id);
CREATE INDEX idx_reports_reported ON reports(reported_id);
CREATE INDEX idx_reports_status ON reports(status);
CREATE INDEX idx_reports_type ON reports(report_type);
CREATE INDEX idx_admin_users_role ON admin_users(role);
CREATE INDEX idx_moderation_actions_admin ON moderation_actions(admin_id);
CREATE INDEX idx_moderation_actions_target ON moderation_actions(target_user_id);
CREATE INDEX idx_user_bans_user ON user_bans(user_id);
CREATE INDEX idx_user_bans_active ON user_bans(is_active) WHERE is_active = TRUE;

-- Special index for case-insensitive email uniqueness
CREATE UNIQUE INDEX idx_users_email_lower ON users (LOWER(email));

-- Functions and triggers for automatic updates
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Add updated_at triggers
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_match_requests_updated_at BEFORE UPDATE ON match_requests FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_chat_rooms_updated_at BEFORE UPDATE ON chat_rooms FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_payments_updated_at BEFORE UPDATE ON payments FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Function to reset daily likes count
CREATE OR REPLACE FUNCTION reset_daily_likes()
RETURNS void AS $$
BEGIN
    UPDATE users 
    SET daily_likes_count = 0, daily_likes_reset_at = NOW()
    WHERE daily_likes_reset_at < NOW() - INTERVAL '12 hours';
END;
$$ LANGUAGE plpgsql;

-- Function to clean expired super like priorities
CREATE OR REPLACE FUNCTION clean_expired_super_like_priorities()
RETURNS void AS $$
BEGIN
    UPDATE match_requests 
    SET super_like_priority_expires_at = NULL
    WHERE super_like_priority_expires_at IS NOT NULL 
    AND super_like_priority_expires_at < NOW();
END;
$$ LANGUAGE plpgsql;