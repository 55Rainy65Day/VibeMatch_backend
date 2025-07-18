# VibesMatch - Next-Gen Dating App

A revolutionary dating app built with React Native (Expo) and Supabase that replaces traditional swiping with explicit button interactions and features a unique match request system.

## Features

- 🚫 **No Swipe Gestures** - Clear button interactions (Like, Dislike, Super Like, Direct Message)
- 💎 **Super Like System** - Premium interactions with 48-hour priority
- 💬 **Match Request System** - All interactions create requests that recipients can accept/decline
- 🔍 **Advanced Discovery** - Activity-based sorting with comprehensive filters
- 💰 **Premium Features** - Unlimited likes, direct messaging, read receipts, and more
- 🎨 **Theme Support** - Light/dark mode with system preference detection
- 🔔 **Real-time Notifications** - In-app and push notifications
- 📱 **Cross-Platform** - iOS and Android support

## Tech Stack

### Frontend
- **React Native** with Expo SDK 49+
- **TypeScript** for type safety
- **React Navigation 6** for navigation
- **React Query** for state management and caching
- **React Native Reanimated** for smooth animations

### Backend
- **Supabase** (PostgreSQL + Real-time + Auth + Storage)
- **Row Level Security (RLS)** for data protection
- **Supabase Edge Functions** for complex business logic

### Additional Services
- **Stripe** for payment processing
- **Expo Push Notifications** for mobile notifications

## Getting Started

### Prerequisites

- Node.js 18+ and npm
- Expo CLI: `npm install -g @expo/cli`
- Supabase account
- Stripe account (for payments)

### Installation

1. **Clone and install dependencies:**
   ```bash
   cd VibesMatch
   npm install
   ```

2. **Set up Supabase:**
   - Create a new Supabase project
   - Run the database schema: `supabase/schema.sql`
   - Apply RLS policies: `supabase/rls-policies.sql`
   - Enable Google OAuth in Supabase Auth settings

3. **Configure environment variables:**
   ```bash
   cp .env.example .env
   ```
   
   Update `.env` with your actual values:
   ```
   EXPO_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
   EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
   EXPO_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_your-stripe-key-here
   ```

4. **Start the development server:**
   ```bash
   npm start
   ```

### Database Setup

The app uses a fully normalized PostgreSQL database with the following tables:

**Reference Tables (Lookup Data):**
- `countries` - World countries with ISO codes and continent information
- `genders` - Gender options (male, female, non-binary, etc.)
- `personality_types` - MBTI personality types with descriptions
- `interest_categories` - Categories for interests (Sports, Arts, etc.)
- `interests` - Individual interests linked to categories
- `exercise_levels`, `education_levels`, `job_types` - Lifestyle options
- `drinking_habits`, `smoking_habits`, `kids_preferences` - Personal preferences
- `ethnicities`, `religions` - Cultural background options
- `relationship_types`, `relationship_statuses`, `sexualities` - Relationship preferences
- `looking_for_options` - What users are seeking (dating, friends, etc.)

**Core Tables:**
- `users` - User profiles with foreign keys to reference tables
- `user_interests` - Many-to-many: users ↔ interests
- `user_looking_for` - Many-to-many: users ↔ looking_for_options
- `user_preferred_genders` - Many-to-many: users ↔ preferred genders
- `photos` - User profile photos
- `match_requests` - All user interactions (likes, super likes, messages)
- `matches` - Successful matches
- `chat_rooms` - Chat sessions
- `messages` - Chat messages
- `profile_views` - Profile view tracking
- `user_interactions` - Interaction history
- `notifications` - In-app notifications
- `payments` - Payment tracking

Run the SQL files in this order:
1. `supabase/schema.sql` - Creates all tables, indexes, and ENUM types
2. `supabase/countries-data.sql` - Populates countries with world data
3. `supabase/reference-data.sql` - Populates all reference/lookup tables
4. `supabase/rls-policies.sql` - Sets up Row Level Security

### Production-Ready Database Features

**🔧 Advanced PostgreSQL Features:**
- Native ENUM types for better type safety and performance
- TIMESTAMPTZ for proper timezone handling (UTC storage)
- TEXT fields for URLs to avoid length limitations
- Case-insensitive email uniqueness with functional indexes
- Comprehensive indexing strategy for optimal performance

**🛡️ Enterprise-Grade Security:**
- Row Level Security (RLS) on all tables
- Admin role-based access control
- Audit trails for all moderation actions
- Privacy-first blocking and reporting system

**📊 Analytics & Monitoring Ready:**
- Proper relational structure for complex queries
- Audit trails for user actions and moderation
- Performance indexes for real-time analytics
- Comprehensive metadata tracking

### Enhanced Features

**🌍 Geolocation Support:**
- Latitude/longitude coordinates for distance-based matching
- "Show nearest first" filtering capability
- Privacy controls for distance visibility

**🚫 Advanced Blocking System:**
- Separate `user_blocks` table for better privacy logic
- Reason tracking for blocks
- Efficient querying and privacy protection

**📱 Rich Media Messaging:**
- Support for text, images, voice, video, GIFs, stickers, location, files
- Media processing pipeline with status tracking
- Thumbnail generation for videos
- File size and duration metadata

**🛡️ Comprehensive Moderation:**
- User reporting system with multiple categories
- Admin user management with role-based permissions
- Moderation action tracking and audit trail
- User ban system (temporary/permanent)
- Evidence collection for reports

### Benefits of Enhanced Structure

- **Data Consistency**: All options are standardized across the app
- **Easy Updates**: Add new interests, genders, etc. without code changes
- **Better Performance**: Indexed lookups instead of text searches
- **Internationalization Ready**: Easy to add translations for all options
- **Analytics Friendly**: Proper relational data for insights
- **Safety First**: Comprehensive moderation and reporting tools
- **Rich Communication**: Full media support in messaging
- **Location Aware**: Distance-based matching capabilities

### Development

```bash
# Start development server
npm start

# Run on iOS simulator
npm run ios

# Run on Android emulator
npm run android

# Run on web
npm run web
```

## Project Structure

```
VibesMatch/
├── src/
│   ├── components/     # Reusable UI components
│   ├── screens/        # Screen components
│   ├── services/       # API services and business logic
│   ├── hooks/          # Custom React hooks
│   ├── utils/          # Utility functions
│   ├── types/          # TypeScript type definitions
│   └── lib/            # Third-party library configurations
├── supabase/           # Database schema and policies
├── assets/             # Static assets (images, fonts)
└── app.json           # Expo configuration
```

## Key Features Implementation

### Match Request System
All user interactions (likes, super likes, direct messages) create match requests that appear in the recipient's requests page. This replaces traditional mutual-like matching.

### Super Like Priority
Super Likes appear first in the recipient's requests for 48 hours, regardless of when they were sent compared to regular likes.

### Discovery Algorithm
Profiles are sorted by activity (most active/online first) and filtered based on user preferences and previous interactions.

### Premium Features
- Direct messaging without match requirements
- Unlimited likes (free users limited to 20 every 12 hours)
- Read receipts
- Hide country option
- 2 Super Likes per week
- View "Last Seen" status

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@vibesmatch.com or join our Discord community.