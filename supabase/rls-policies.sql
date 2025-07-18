-- Row Level Security Policies for VibesMatch
-- These policies ensure users can only access data they're authorized to see

-- Enable RLS on all tables
ALTER TABLE countries ENABLE ROW LEVEL SECURITY;
ALTER TABLE genders ENABLE ROW LEVEL SECURITY;
ALTER TABLE personality_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE interest_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE interests ENABLE ROW LEVEL SECURITY;
ALTER TABLE exercise_levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE education_levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE job_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE drinking_habits ENABLE ROW LEVEL SECURITY;
ALTER TABLE smoking_habits ENABLE ROW LEVEL SECURITY;
ALTER TABLE kids_preferences ENABLE ROW LEVEL SECURITY;
ALTER TABLE ethnicities ENABLE ROW LEVEL SECURITY;
ALTER TABLE religions ENABLE ROW LEVEL SECURITY;
ALTER TABLE relationship_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE relationship_statuses ENABLE ROW LEVEL SECURITY;
ALTER TABLE sexualities ENABLE ROW LEVEL SECURITY;
ALTER TABLE looking_for_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_interests ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_looking_for ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_preferred_genders ENABLE ROW LEVEL SECURITY;
ALTER TABLE photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE match_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE matches ENABLE ROW LEVEL SECURITY;
ALTER TABLE chat_rooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE media_attachments ENABLE ROW LEVEL SECURITY;
ALTER TABLE profile_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_interactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_blocks ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE moderation_actions ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_bans ENABLE ROW LEVEL SECURITY;
ALTER TABLE payments ENABLE ROW LEVEL SECURITY;

-- Countries table policies
CREATE POLICY "Anyone can view countries" ON countries
    FOR SELECT USING (true); -- Countries are public data

-- Reference tables policies (all public read-only data)
CREATE POLICY "Anyone can view genders" ON genders
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view personality types" ON personality_types
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view interest categories" ON interest_categories
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view interests" ON interests
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view exercise levels" ON exercise_levels
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view education levels" ON education_levels
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view job types" ON job_types
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view drinking habits" ON drinking_habits
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view smoking habits" ON smoking_habits
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view kids preferences" ON kids_preferences
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view ethnicities" ON ethnicities
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view religions" ON religions
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view relationship types" ON relationship_types
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view relationship statuses" ON relationship_statuses
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view sexualities" ON sexualities
    FOR SELECT USING (true);

CREATE POLICY "Anyone can view looking for options" ON looking_for_options
    FOR SELECT USING (true);

-- Junction tables policies
CREATE POLICY "Users can manage their own interests" ON user_interests
    FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can view interests of discoverable profiles" ON user_interests
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND
        (
            user_id = auth.uid() OR
            EXISTS (
                SELECT 1 FROM users 
                WHERE users.id = user_interests.user_id 
                AND users.id != auth.uid()
                AND NOT EXISTS (
                    SELECT 1 FROM user_interactions 
                    WHERE user_id = auth.uid() AND target_user_id = users.id
                )
            )
        )
    );

CREATE POLICY "Users can manage their own looking for preferences" ON user_looking_for
    FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can view looking for preferences of discoverable profiles" ON user_looking_for
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND
        (
            user_id = auth.uid() OR
            EXISTS (
                SELECT 1 FROM users 
                WHERE users.id = user_looking_for.user_id 
                AND users.id != auth.uid()
                AND NOT EXISTS (
                    SELECT 1 FROM user_interactions 
                    WHERE user_id = auth.uid() AND target_user_id = users.id
                )
            )
        )
    );

CREATE POLICY "Users can manage their own preferred genders" ON user_preferred_genders
    FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can view preferred genders of discoverable profiles" ON user_preferred_genders
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND
        (
            user_id = auth.uid() OR
            EXISTS (
                SELECT 1 FROM users 
                WHERE users.id = user_preferred_genders.user_id 
                AND users.id != auth.uid()
                AND NOT EXISTS (
                    SELECT 1 FROM user_interactions 
                    WHERE user_id = auth.uid() AND target_user_id = users.id
                )
            )
        )
    );

-- Users table policies
CREATE POLICY "Users can view their own profile" ON users
    FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update their own profile" ON users
    FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can view other profiles for discovery" ON users
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND 
        id != auth.uid() AND
        -- Don't show users they've already interacted with
        NOT EXISTS (
            SELECT 1 FROM user_interactions 
            WHERE user_id = auth.uid() AND target_user_id = users.id
        )
    );

-- Photos table policies
CREATE POLICY "Users can manage their own photos" ON photos
    FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can view photos of discoverable profiles" ON photos
    FOR SELECT USING (
        auth.uid() IS NOT NULL AND
        (
            user_id = auth.uid() OR
            EXISTS (
                SELECT 1 FROM users 
                WHERE users.id = photos.user_id 
                AND users.id != auth.uid()
                AND NOT EXISTS (
                    SELECT 1 FROM user_interactions 
                    WHERE user_id = auth.uid() AND target_user_id = users.id
                )
            )
        )
    );

-- Match requests table policies
CREATE POLICY "Users can view their sent requests" ON match_requests
    FOR SELECT USING (auth.uid() = sender_id);

CREATE POLICY "Users can view their received requests" ON match_requests
    FOR SELECT USING (auth.uid() = receiver_id);

CREATE POLICY "Users can create match requests" ON match_requests
    FOR INSERT WITH CHECK (auth.uid() = sender_id);

CREATE POLICY "Users can update their sent requests" ON match_requests
    FOR UPDATE USING (auth.uid() = sender_id);

CREATE POLICY "Users can update their received requests" ON match_requests
    FOR UPDATE USING (auth.uid() = receiver_id);

-- Matches table policies
CREATE POLICY "Users can view their matches" ON matches
    FOR SELECT USING (auth.uid() = user1_id OR auth.uid() = user2_id);

CREATE POLICY "System can create matches" ON matches
    FOR INSERT WITH CHECK (true); -- Matches are created by triggers/functions

-- Chat rooms table policies
CREATE POLICY "Users can view their chat rooms" ON chat_rooms
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM matches 
            WHERE matches.id = chat_rooms.match_id 
            AND (matches.user1_id = auth.uid() OR matches.user2_id = auth.uid())
        )
    );

CREATE POLICY "System can manage chat rooms" ON chat_rooms
    FOR ALL USING (true); -- Chat rooms are managed by the system

-- Messages table policies
CREATE POLICY "Users can view messages in their chat rooms" ON messages
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM chat_rooms
            JOIN matches ON matches.id = chat_rooms.match_id
            WHERE chat_rooms.id = messages.chat_room_id
            AND (matches.user1_id = auth.uid() OR matches.user2_id = auth.uid())
        )
    );

CREATE POLICY "Users can send messages in their chat rooms" ON messages
    FOR INSERT WITH CHECK (
        auth.uid() = sender_id AND
        EXISTS (
            SELECT 1 FROM chat_rooms
            JOIN matches ON matches.id = chat_rooms.match_id
            WHERE chat_rooms.id = messages.chat_room_id
            AND (matches.user1_id = auth.uid() OR matches.user2_id = auth.uid())
        )
    );

CREATE POLICY "Users can update their own messages" ON messages
    FOR UPDATE USING (auth.uid() = sender_id);

-- Profile views table policies
CREATE POLICY "Users can view their profile view history" ON profile_views
    FOR SELECT USING (auth.uid() = viewer_id OR auth.uid() = viewed_id);

CREATE POLICY "Users can create profile views" ON profile_views
    FOR INSERT WITH CHECK (auth.uid() = viewer_id);

-- User interactions table policies
CREATE POLICY "Users can view their interactions" ON user_interactions
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can create interactions" ON user_interactions
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their interactions" ON user_interactions
    FOR UPDATE USING (auth.uid() = user_id);

-- Notifications table policies
CREATE POLICY "Users can view their notifications" ON notifications
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can update their notifications" ON notifications
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "System can create notifications" ON notifications
    FOR INSERT WITH CHECK (true); -- Notifications are created by the system

-- Payments table policies
CREATE POLICY "Users can view their payments" ON payments
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can create payments" ON payments
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "System can update payments" ON payments
    FOR UPDATE USING (true); -- Payment status updates are handled by the system
-- User b
locks table policies
CREATE POLICY "Users can manage their own blocks" ON user_blocks
    FOR ALL USING (auth.uid() = blocker_id);

CREATE POLICY "Users cannot see who blocked them" ON user_blocks
    FOR SELECT USING (auth.uid() = blocker_id); -- Only blocker can see their blocks

-- Media attachments table policies
CREATE POLICY "Users can view media in their conversations" ON media_attachments
    FOR SELECT USING (
        auth.uid() = user_id OR
        EXISTS (
            SELECT 1 FROM messages
            JOIN chat_rooms ON chat_rooms.id = messages.chat_room_id
            JOIN matches ON matches.id = chat_rooms.match_id
            WHERE messages.id = media_attachments.message_id
            AND (matches.user1_id = auth.uid() OR matches.user2_id = auth.uid())
        )
    );

CREATE POLICY "Users can upload media to their messages" ON media_attachments
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "System can update media processing status" ON media_attachments
    FOR UPDATE USING (true); -- System updates processing status

-- Reports table policies
CREATE POLICY "Users can view their own reports" ON reports
    FOR SELECT USING (auth.uid() = reporter_id);

CREATE POLICY "Users can create reports" ON reports
    FOR INSERT WITH CHECK (auth.uid() = reporter_id);

CREATE POLICY "Admins can view all reports" ON reports
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM admin_users 
            WHERE admin_users.user_id = auth.uid()
        )
    );

CREATE POLICY "Admins can update reports" ON reports
    FOR UPDATE USING (
        EXISTS (
            SELECT 1 FROM admin_users 
            WHERE admin_users.user_id = auth.uid()
        )
    );

-- Admin users table policies
CREATE POLICY "Admins can view admin users" ON admin_users
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM admin_users au
            WHERE au.user_id = auth.uid()
        )
    );

CREATE POLICY "Super admins can manage admin users" ON admin_users
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM admin_users au
            WHERE au.user_id = auth.uid() AND au.role = 'super_admin'
        )
    );

-- Moderation actions table policies
CREATE POLICY "Admins can view moderation actions" ON moderation_actions
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM admin_users 
            WHERE admin_users.user_id = auth.uid()
        )
    );

CREATE POLICY "Admins can create moderation actions" ON moderation_actions
    FOR INSERT WITH CHECK (
        EXISTS (
            SELECT 1 FROM admin_users 
            WHERE admin_users.user_id = auth.uid() AND admin_users.id = moderation_actions.admin_id
        )
    );

-- User bans table policies
CREATE POLICY "Admins can view user bans" ON user_bans
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM admin_users 
            WHERE admin_users.user_id = auth.uid()
        )
    );

CREATE POLICY "Admins can manage user bans" ON user_bans
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM admin_users 
            WHERE admin_users.user_id = auth.uid()
        )
    );