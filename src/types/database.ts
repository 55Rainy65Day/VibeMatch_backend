// Database types for VibesMatch
// Auto-generated types based on the Supabase schema

export interface Database {
  public: {
    Enums: {
      continent_type: 'Africa' | 'Antarctica' | 'Asia' | 'Europe' | 'North America' | 'Oceania' | 'South America';
      match_request_type: 'like' | 'super_like' | 'direct_message';
      match_request_status: 'pending' | 'accepted' | 'declined' | 'cancelled';
      message_type: 'text' | 'image' | 'voice' | 'video' | 'gif' | 'sticker' | 'location' | 'file';
      processing_status: 'pending' | 'processing' | 'completed' | 'failed';
      notification_type: 'match' | 'message' | 'request' | 'view';
      report_type: 'inappropriate_content' | 'harassment' | 'fake_profile' | 'spam' | 'underage' | 'violence' | 'hate_speech' | 'nudity' | 'scam' | 'other';
      report_status: 'pending' | 'under_review' | 'resolved' | 'dismissed';
      admin_role: 'super_admin' | 'admin' | 'moderator';
      moderation_action_type: 'warning' | 'temporary_ban' | 'permanent_ban' | 'profile_review' | 'content_removal' | 'account_verification';
      ban_type: 'temporary' | 'permanent';
      payment_type: 'super_likes' | 'premium';
      payment_status: 'pending' | 'completed' | 'failed' | 'refunded';
      user_action: 'like' | 'dislike' | 'super_like' | 'message';
    };
    Tables: {
      countries: {
        Row: {
          id: string;
          code: string;
          code3: string;
          name: string;
          continent: 'Africa' | 'Antarctica' | 'Asia' | 'Europe' | 'North America' | 'Oceania' | 'South America';
          region: string | null;
          capital: string | null;
          currency_code: string | null;
          phone_code: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          code3: string;
          name: string;
          continent: 'Africa' | 'Antarctica' | 'Asia' | 'Europe' | 'North America' | 'Oceania' | 'South America';
          region?: string | null;
          capital?: string | null;
          currency_code?: string | null;
          phone_code?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          code3?: string;
          name?: string;
          continent?: 'Africa' | 'Antarctica' | 'Asia' | 'Europe' | 'North America' | 'Oceania' | 'South America';
          region?: string | null;
          capital?: string | null;
          currency_code?: string | null;
          phone_code?: string | null;
          created_at?: string;
        };
      };
      genders: {
        Row: {
          id: string;
          code: string;
          name: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          created_at?: string;
        };
      };
      personality_types: {
        Row: {
          id: string;
          code: string;
          name: string;
          description: string | null;
          category: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          description?: string | null;
          category: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          description?: string | null;
          category?: string;
          created_at?: string;
        };
      };
      interest_categories: {
        Row: {
          id: string;
          name: string;
          emoji: string | null;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          name: string;
          emoji?: string | null;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          name?: string;
          emoji?: string | null;
          sort_order?: number;
          created_at?: string;
        };
      };
      interests: {
        Row: {
          id: string;
          name: string;
          category_id: string;
          emoji: string | null;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          name: string;
          category_id: string;
          emoji?: string | null;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          name?: string;
          category_id?: string;
          emoji?: string | null;
          sort_order?: number;
          created_at?: string;
        };
      };
      exercise_levels: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      education_levels: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      job_types: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      drinking_habits: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      smoking_habits: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      kids_preferences: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      ethnicities: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      religions: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      relationship_types: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      relationship_statuses: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      sexualities: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      looking_for_options: {
        Row: {
          id: string;
          code: string;
          name: string;
          sort_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: string;
          name: string;
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: string;
          name?: string;
          sort_order?: number;
          created_at?: string;
        };
      };
      users: {
        Row: {
          id: string;
          email: string;
          name: string;
          bio: string | null;
          age: number;
          gender_id: string;
          country_id: string;
          state: string | null;
          city: string | null;
          latitude: number | null;
          longitude: number | null;
          location_updated_at: string | null;
          show_distance: boolean;
          exercise_level_id: string | null;
          education_level_id: string | null;
          job_type_id: string | null;
          drinking_habit_id: string | null;
          smoking_habit_id: string | null;
          kids_preference_id: string | null;
          ethnicity_id: string | null;
          religion_id: string | null;
          relationship_type_id: string | null;
          relationship_status_id: string | null;
          sexuality_id: string | null;
          personality_type_id: string | null;
          age_range_min: number;
          age_range_max: number;
          settings: Json;
          is_premium: boolean;
          premium_expires_at: string | null;
          super_likes_count: number;
          daily_likes_count: number;
          daily_likes_reset_at: string;
          last_active: string;
          allow_search: boolean;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          email: string;
          name: string;
          bio?: string | null;
          age: number;
          gender_id: string;
          country_id: string;
          state?: string | null;
          city?: string | null;
          latitude?: number | null;
          longitude?: number | null;
          location_updated_at?: string | null;
          show_distance?: boolean;
          exercise_level_id?: string | null;
          education_level_id?: string | null;
          job_type_id?: string | null;
          drinking_habit_id?: string | null;
          smoking_habit_id?: string | null;
          kids_preference_id?: string | null;
          ethnicity_id?: string | null;
          religion_id?: string | null;
          relationship_type_id?: string | null;
          relationship_status_id?: string | null;
          sexuality_id?: string | null;
          personality_type_id?: string | null;
          age_range_min?: number;
          age_range_max?: number;
          settings?: Json;
          is_premium?: boolean;
          premium_expires_at?: string | null;
          super_likes_count?: number;
          daily_likes_count?: number;
          daily_likes_reset_at?: string;
          last_active?: string;
          allow_search?: boolean;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          email?: string;
          name?: string;
          bio?: string | null;
          age?: number;
          gender_id?: string;
          country_id?: string;
          state?: string | null;
          city?: string | null;
          latitude?: number | null;
          longitude?: number | null;
          location_updated_at?: string | null;
          show_distance?: boolean;
          exercise_level_id?: string | null;
          education_level_id?: string | null;
          job_type_id?: string | null;
          drinking_habit_id?: string | null;
          smoking_habit_id?: string | null;
          kids_preference_id?: string | null;
          ethnicity_id?: string | null;
          religion_id?: string | null;
          relationship_type_id?: string | null;
          relationship_status_id?: string | null;
          sexuality_id?: string | null;
          personality_type_id?: string | null;
          age_range_min?: number;
          age_range_max?: number;
          settings?: Json;
          is_premium?: boolean;
          premium_expires_at?: string | null;
          super_likes_count?: number;
          daily_likes_count?: number;
          daily_likes_reset_at?: string;
          last_active?: string;
          allow_search?: boolean;
          created_at?: string;
          updated_at?: string;
        };
      };
      user_interests: {
        Row: {
          id: string;
          user_id: string;
          interest_id: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          interest_id: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          interest_id?: string;
          created_at?: string;
        };
      };
      user_looking_for: {
        Row: {
          id: string;
          user_id: string;
          looking_for_id: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          looking_for_id: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          looking_for_id?: string;
          created_at?: string;
        };
      };
      user_preferred_genders: {
        Row: {
          id: string;
          user_id: string;
          gender_id: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          gender_id: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          gender_id?: string;
          created_at?: string;
        };
      };
      photos: {
        Row: {
          id: string;
          user_id: string;
          url: string;
          position: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          url: string;
          position: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          url?: string;
          position?: number;
          created_at?: string;
        };
      };
      match_requests: {
        Row: {
          id: string;
          sender_id: string;
          receiver_id: string;
          type: 'like' | 'super_like' | 'direct_message';
          message: string | null;
          status: 'pending' | 'accepted' | 'declined' | 'cancelled';
          super_like_priority_expires_at: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          sender_id: string;
          receiver_id: string;
          type: 'like' | 'super_like' | 'direct_message';
          message?: string | null;
          status?: 'pending' | 'accepted' | 'declined' | 'cancelled';
          super_like_priority_expires_at?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          sender_id?: string;
          receiver_id?: string;
          type?: 'like' | 'super_like' | 'direct_message';
          message?: string | null;
          status?: 'pending' | 'accepted' | 'declined' | 'cancelled';
          super_like_priority_expires_at?: string | null;
          created_at?: string;
          updated_at?: string;
        };
      };
      matches: {
        Row: {
          id: string;
          user1_id: string;
          user2_id: string;
          created_from_request_id: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          user1_id: string;
          user2_id: string;
          created_from_request_id?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          user1_id?: string;
          user2_id?: string;
          created_from_request_id?: string | null;
          created_at?: string;
        };
      };
      chat_rooms: {
        Row: {
          id: string;
          match_id: string;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          match_id: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          match_id?: string;
          created_at?: string;
          updated_at?: string;
        };
      };
      messages: {
        Row: {
          id: string;
          chat_room_id: string;
          sender_id: string;
          content: string | null;
          type: 'text' | 'image' | 'voice' | 'video' | 'gif' | 'sticker' | 'location' | 'file';
          media_url: string | null;
          media_thumbnail_url: string | null;
          media_duration: number | null;
          media_size: number | null;
          media_mime_type: string | null;
          read_at: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          chat_room_id: string;
          sender_id: string;
          content?: string | null;
          type?: 'text' | 'image' | 'voice' | 'video' | 'gif' | 'sticker' | 'location' | 'file';
          media_url?: string | null;
          media_thumbnail_url?: string | null;
          media_duration?: number | null;
          media_size?: number | null;
          media_mime_type?: string | null;
          read_at?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          chat_room_id?: string;
          sender_id?: string;
          content?: string | null;
          type?: 'text' | 'image' | 'voice' | 'video' | 'gif' | 'sticker' | 'location' | 'file';
          media_url?: string | null;
          media_thumbnail_url?: string | null;
          media_duration?: number | null;
          media_size?: number | null;
          media_mime_type?: string | null;
          read_at?: string | null;
          created_at?: string;
        };
      };
      media_attachments: {
        Row: {
          id: string;
          user_id: string;
          message_id: string;
          original_filename: string | null;
          file_path: string;
          file_size: number;
          mime_type: string;
          width: number | null;
          height: number | null;
          duration: number | null;
          thumbnail_path: string | null;
          processing_status: 'pending' | 'processing' | 'completed' | 'failed';
          metadata: Json;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          message_id: string;
          original_filename?: string | null;
          file_path: string;
          file_size: number;
          mime_type: string;
          width?: number | null;
          height?: number | null;
          duration?: number | null;
          thumbnail_path?: string | null;
          processing_status?: 'pending' | 'processing' | 'completed' | 'failed';
          metadata?: Json;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          message_id?: string;
          original_filename?: string | null;
          file_path?: string;
          file_size?: number;
          mime_type?: string;
          width?: number | null;
          height?: number | null;
          duration?: number | null;
          thumbnail_path?: string | null;
          processing_status?: 'pending' | 'processing' | 'completed' | 'failed';
          metadata?: Json;
          created_at?: string;
          updated_at?: string;
        };
      };
      profile_views: {
        Row: {
          id: string;
          viewer_id: string;
          viewed_id: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          viewer_id: string;
          viewed_id: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          viewer_id?: string;
          viewed_id?: string;
          created_at?: string;
        };
      };
      user_interactions: {
        Row: {
          id: string;
          user_id: string;
          target_user_id: string;
          action: 'like' | 'dislike' | 'super_like' | 'message';
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          target_user_id: string;
          action: 'like' | 'dislike' | 'super_like' | 'message';
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          target_user_id?: string;
          action?: 'like' | 'dislike' | 'super_like' | 'message';
          created_at?: string;
        };
      };
      user_blocks: {
        Row: {
          id: string;
          blocker_id: string;
          blocked_id: string;
          reason: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          blocker_id: string;
          blocked_id: string;
          reason?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          blocker_id?: string;
          blocked_id?: string;
          reason?: string | null;
          created_at?: string;
        };
      };
      notifications: {
        Row: {
          id: string;
          user_id: string;
          type: 'match' | 'message' | 'request' | 'view';
          title: string;
          body: string;
          data: Json;
          read_at: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          type: 'match' | 'message' | 'request' | 'view';
          title: string;
          body: string;
          data?: Json;
          read_at?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          type?: 'match' | 'message' | 'request' | 'view';
          title?: string;
          body?: string;
          data?: Json;
          read_at?: string | null;
          created_at?: string;
        };
      };
      reports: {
        Row: {
          id: string;
          reporter_id: string;
          reported_id: string;
          report_type: 'inappropriate_content' | 'harassment' | 'fake_profile' | 'spam' | 'underage' | 'violence' | 'hate_speech' | 'nudity' | 'scam' | 'other';
          reason: string;
          description: string | null;
          evidence_urls: string[] | null;
          status: 'pending' | 'under_review' | 'resolved' | 'dismissed';
          admin_notes: string | null;
          admin_id: string | null;
          resolved_at: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          reporter_id: string;
          reported_id: string;
          report_type: 'inappropriate_content' | 'harassment' | 'fake_profile' | 'spam' | 'underage' | 'violence' | 'hate_speech' | 'nudity' | 'scam' | 'other';
          reason: string;
          description?: string | null;
          evidence_urls?: string[] | null;
          status?: 'pending' | 'under_review' | 'resolved' | 'dismissed';
          admin_notes?: string | null;
          admin_id?: string | null;
          resolved_at?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          reporter_id?: string;
          reported_id?: string;
          report_type?: 'inappropriate_content' | 'harassment' | 'fake_profile' | 'spam' | 'underage' | 'violence' | 'hate_speech' | 'nudity' | 'scam' | 'other';
          reason?: string;
          description?: string | null;
          evidence_urls?: string[] | null;
          status?: 'pending' | 'under_review' | 'resolved' | 'dismissed';
          admin_notes?: string | null;
          admin_id?: string | null;
          resolved_at?: string | null;
          created_at?: string;
          updated_at?: string;
        };
      };
      admin_users: {
        Row: {
          id: string;
          user_id: string;
          role: 'super_admin' | 'admin' | 'moderator';
          permissions: Json;
          created_by: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          role: 'super_admin' | 'admin' | 'moderator';
          permissions?: Json;
          created_by?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          role?: 'super_admin' | 'admin' | 'moderator';
          permissions?: Json;
          created_by?: string | null;
          created_at?: string;
          updated_at?: string;
        };
      };
      moderation_actions: {
        Row: {
          id: string;
          admin_id: string;
          target_user_id: string;
          action_type: 'warning' | 'temporary_ban' | 'permanent_ban' | 'profile_review' | 'content_removal' | 'account_verification';
          reason: string;
          duration_hours: number | null;
          expires_at: string | null;
          metadata: Json;
          created_at: string;
        };
        Insert: {
          id?: string;
          admin_id: string;
          target_user_id: string;
          action_type: 'warning' | 'temporary_ban' | 'permanent_ban' | 'profile_review' | 'content_removal' | 'account_verification';
          reason: string;
          duration_hours?: number | null;
          expires_at?: string | null;
          metadata?: Json;
          created_at?: string;
        };
        Update: {
          id?: string;
          admin_id?: string;
          target_user_id?: string;
          action_type?: 'warning' | 'temporary_ban' | 'permanent_ban' | 'profile_review' | 'content_removal' | 'account_verification';
          reason?: string;
          duration_hours?: number | null;
          expires_at?: string | null;
          metadata?: Json;
          created_at?: string;
        };
      };
      user_bans: {
        Row: {
          id: string;
          user_id: string;
          ban_type: 'temporary' | 'permanent';
          reason: string;
          banned_by: string;
          expires_at: string | null;
          is_active: boolean;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          ban_type: 'temporary' | 'permanent';
          reason: string;
          banned_by: string;
          expires_at?: string | null;
          is_active?: boolean;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          ban_type?: 'temporary' | 'permanent';
          reason?: string;
          banned_by?: string;
          expires_at?: string | null;
          is_active?: boolean;
          created_at?: string;
          updated_at?: string;
        };
      };
      payments: {
        Row: {
          id: string;
          user_id: string;
          type: 'super_likes' | 'premium';
          amount: number;
          currency: string;
          stripe_payment_intent_id: string | null;
          status: 'pending' | 'completed' | 'failed' | 'refunded';
          metadata: Json;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          type: 'super_likes' | 'premium';
          amount: number;
          currency?: string;
          stripe_payment_intent_id?: string | null;
          status?: 'pending' | 'completed' | 'failed' | 'refunded';
          metadata?: Json;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          type?: 'super_likes' | 'premium';
          amount?: number;
          currency?: string;
          stripe_payment_intent_id?: string | null;
          status?: 'pending' | 'completed' | 'failed' | 'refunded';
          metadata?: Json;
          created_at?: string;
          updated_at?: string;
        };
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      [_ in never]: never;
    };
  };
}

type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[];