// Application types for VibesMatch
import { Database } from './database';

// Database table types
export type Country = Database['public']['Tables']['countries']['Row'];
export type CountryInsert = Database['public']['Tables']['countries']['Insert'];

export type Gender = Database['public']['Tables']['genders']['Row'];
export type PersonalityType = Database['public']['Tables']['personality_types']['Row'];
export type InterestCategoryData = Database['public']['Tables']['interest_categories']['Row'];
export type InterestData = Database['public']['Tables']['interests']['Row'];
export type ExerciseLevel = Database['public']['Tables']['exercise_levels']['Row'];
export type EducationLevel = Database['public']['Tables']['education_levels']['Row'];
export type JobType = Database['public']['Tables']['job_types']['Row'];
export type DrinkingHabit = Database['public']['Tables']['drinking_habits']['Row'];
export type SmokingHabit = Database['public']['Tables']['smoking_habits']['Row'];
export type KidsPreference = Database['public']['Tables']['kids_preferences']['Row'];
export type Ethnicity = Database['public']['Tables']['ethnicities']['Row'];
export type Religion = Database['public']['Tables']['religions']['Row'];
export type RelationshipType = Database['public']['Tables']['relationship_types']['Row'];
export type RelationshipStatus = Database['public']['Tables']['relationship_statuses']['Row'];
export type Sexuality = Database['public']['Tables']['sexualities']['Row'];
export type LookingForOption = Database['public']['Tables']['looking_for_options']['Row'];

export type User = Database['public']['Tables']['users']['Row'];
export type UserInsert = Database['public']['Tables']['users']['Insert'];
export type UserUpdate = Database['public']['Tables']['users']['Update'];

export type UserInterest = Database['public']['Tables']['user_interests']['Row'];
export type UserLookingFor = Database['public']['Tables']['user_looking_for']['Row'];
export type UserPreferredGender = Database['public']['Tables']['user_preferred_genders']['Row'];

export type UserBlock = Database['public']['Tables']['user_blocks']['Row'];
export type MediaAttachment = Database['public']['Tables']['media_attachments']['Row'];
export type Report = Database['public']['Tables']['reports']['Row'];
export type AdminUser = Database['public']['Tables']['admin_users']['Row'];
export type ModerationAction = Database['public']['Tables']['moderation_actions']['Row'];
export type UserBan = Database['public']['Tables']['user_bans']['Row'];

export type Photo = Database['public']['Tables']['photos']['Row'];
export type PhotoInsert = Database['public']['Tables']['photos']['Insert'];

export type MatchRequest = Database['public']['Tables']['match_requests']['Row'];
export type MatchRequestInsert = Database['public']['Tables']['match_requests']['Insert'];
export type MatchRequestUpdate = Database['public']['Tables']['match_requests']['Update'];

export type Match = Database['public']['Tables']['matches']['Row'];
export type MatchInsert = Database['public']['Tables']['matches']['Insert'];

export type ChatRoom = Database['public']['Tables']['chat_rooms']['Row'];
export type Message = Database['public']['Tables']['messages']['Row'];
export type MessageInsert = Database['public']['Tables']['messages']['Insert'];

export type ProfileView = Database['public']['Tables']['profile_views']['Row'];
export type UserInteraction = Database['public']['Tables']['user_interactions']['Row'];
export type Notification = Database['public']['Tables']['notifications']['Row'];
export type Payment = Database['public']['Tables']['payments']['Row'];

// Application-specific types
export interface UserProfile extends User {
  photos: Photo[];
  // Joined reference data
  country: Country;
  gender: Gender;
  exercise_level?: ExerciseLevel;
  education_level?: EducationLevel;
  job_type?: JobType;
  drinking_habit?: DrinkingHabit;
  smoking_habit?: SmokingHabit;
  kids_preference?: KidsPreference;
  ethnicity?: Ethnicity;
  religion?: Religion;
  relationship_type?: RelationshipType;
  relationship_status?: RelationshipStatus;
  sexuality?: Sexuality;
  personality_type?: PersonalityType;
  // Many-to-many relationships
  interests: InterestData[];
  looking_for: LookingForOption[];
  preferred_genders: Gender[];
}

// Legacy interfaces for backward compatibility and easier migration
export interface UserLifestyle {
  exercise: string;
  education: string;
  job: string;
  drinking: string;
  smoking: string;
  kids: string;
  ethnicity: string;
  religion: string;
}

export interface UserPreferences {
  relationshipType: string;
  currentStatus: string;
  sexuality: string;
  lookingFor: string[];
  preferredGenders: string[];
  ageRange: [number, number];
}

export interface UserPersonality {
  mbti: string;
  interests: string[];
}

export interface UserSettings {
  showOnlineStatus: boolean;
  allowSearch: boolean;
  theme: 'light' | 'dark' | 'system';
  notifications: {
    matches: boolean;
    messages: boolean;
    requests: boolean;
    views: boolean;
  };
}

export interface DiscoveryProfile {
  userId: string;
  profile: UserProfile;
  lastActive: string;
  boostExpiresAt?: string;
  distance?: number;
  compatibilityScore: number;
}

export interface DiscoveryFilters {
  gender: string[];
  ageRange: [number, number];
  countries?: string[]; // Array of country IDs
  continents?: string[]; // Filter by continent
  relationshipStatus: string[];
  sexuality: string[];
  personalityType: string[];
  maxDistance?: number;
}

export interface ChatMessage extends Message {
  sender: Pick<User, 'id' | 'name'>;
}

export interface MatchRequestWithProfile extends MatchRequest {
  sender: UserProfile;
  receiver: UserProfile;
}

export interface MatchWithProfiles extends Match {
  user1: UserProfile;
  user2: UserProfile;
  chatRoom?: ChatRoom;
}

// Authentication types
export interface AuthUser {
  id: string;
  email: string;
  isAuthenticated: boolean;
}

export interface SignupData {
  email: string;
  name: string;
  bio?: string;
  age: number;
  genderId: string; // Reference to genders table
  location: {
    countryId: string; // Reference to countries table
    state: string;
    city: string;
  };
  lifestyle: {
    exerciseLevelId?: string;
    educationLevelId?: string;
    jobTypeId?: string;
    drinkingHabitId?: string;
    smokingHabitId?: string;
    kidsPreferenceId?: string;
    ethnicityId?: string;
    religionId?: string;
  };
  preferences: {
    relationshipTypeId?: string;
    relationshipStatusId?: string;
    sexualityId?: string;
    lookingForIds: string[]; // Array of looking_for_options IDs
    preferredGenderIds: string[]; // Array of gender IDs
    ageRange: [number, number];
  };
  personality: {
    personalityTypeId?: string;
    interestIds: string[]; // Array of interest IDs
  };
  photos: string[];
}

export interface SignupStep {
  step: number;
  title: string;
  isComplete: boolean;
  data?: any;
}

// API Response types
export interface ApiResponse<T = any> {
  data?: T;
  error?: {
    code: string;
    message: string;
    details?: any;
  };
  success: boolean;
}

// Super Like types
export interface SuperLikePurchase {
  quantity: 1 | 20 | 50;
  price: number;
}

export const SUPER_LIKE_PACKAGES: SuperLikePurchase[] = [
  { quantity: 1, price: 0.18 },
  { quantity: 20, price: 1.60 },
  { quantity: 50, price: 3.00 },
];

// Premium subscription types
export interface PremiumFeatures {
  directMessaging: boolean;
  unlimitedLikes: boolean;
  readReceipts: boolean;
  hideCountry: boolean;
  superLikesPerWeek: number;
  viewLastSeen: boolean;
}

// Navigation types
export type RootStackParamList = {
  Auth: undefined;
  Main: undefined;
  Profile: { userId: string };
  Chat: { chatRoomId: string };
  SuperLikePurchase: undefined;
  PremiumUpgrade: undefined;
};

export type MainTabParamList = {
  Discovery: undefined;
  Messages: undefined;
  Profile: undefined;
  Search: undefined;
};

export type MessagesTabParamList = {
  Chats: undefined;
  Requests: undefined;
  Views: undefined;
};

// Error types
export interface AppError {
  code: string;
  message: string;
  details?: any;
  timestamp: string;
}

// Legacy constants - now replaced by database tables
// These are kept for backward compatibility during migration
export const LEGACY_INTERESTS_CATEGORIES = {
  'Sports & Fitness': [
    'Running', 'Gym', 'Yoga', 'Swimming', 'Cycling', 'Hiking', 'Dancing', 'Tennis', 'Basketball', 'Football'
  ],
  'Arts & Culture': [
    'Music', 'Movies', 'Reading', 'Photography', 'Painting', 'Theater', 'Museums', 'Concerts', 'Art Galleries', 'Writing'
  ],
  'Food & Drink': [
    'Cooking', 'Wine Tasting', 'Coffee', 'Restaurants', 'Baking', 'Craft Beer', 'Vegetarian', 'Vegan', 'Food Trucks', 'Fine Dining'
  ],
  'Travel & Adventure': [
    'Travel', 'Backpacking', 'Road Trips', 'Beach', 'Mountains', 'Camping', 'Adventure Sports', 'Exploring', 'City Breaks', 'Culture'
  ],
  'Technology': [
    'Gaming', 'Tech', 'Programming', 'Gadgets', 'AI', 'Startups', 'Innovation', 'Apps', 'Social Media', 'Crypto'
  ],
  'Lifestyle': [
    'Fashion', 'Shopping', 'Meditation', 'Wellness', 'Spirituality', 'Volunteering', 'Environment', 'Sustainability', 'Minimalism', 'Self-Care'
  ],
  'Social': [
    'Parties', 'Nightlife', 'Bars', 'Clubs', 'Festivals', 'Networking', 'Meetups', 'Friends', 'Family', 'Community'
  ],
  'Learning': [
    'Languages', 'History', 'Science', 'Philosophy', 'Psychology', 'Business', 'Investing', 'Podcasts', 'Documentaries', 'Online Courses'
  ],
  'Hobbies': [
    'Gardening', 'DIY', 'Crafts', 'Board Games', 'Puzzles', 'Collecting', 'Astronomy', 'Magic', 'Karaoke', 'Trivia'
  ],
  'Pets & Animals': [
    'Dogs', 'Cats', 'Pets', 'Animal Welfare', 'Veterinary', 'Wildlife', 'Zoos', 'Aquariums', 'Pet Training', 'Animal Photography'
  ]
} as const;

// Use database types instead of hardcoded constants
export type InterestCategory = InterestCategoryData;
export type Interest = InterestData;

// Country and location types
export type Continent = 'Africa' | 'Antarctica' | 'Asia' | 'Europe' | 'North America' | 'Oceania' | 'South America';

export interface CountryWithFlag extends Country {
  flag?: string; // Unicode flag emoji
}

export interface LocationData {
  country: Country;
  state?: string;
  city?: string;
  coordinates?: {
    latitude: number;
    longitude: number;
  };
}

// Popular countries for quick selection during signup
export const POPULAR_COUNTRIES = [
  'US', // United States
  'GB', // United Kingdom
  'CA', // Canada
  'AU', // Australia
  'DE', // Germany
  'FR', // France
  'IT', // Italy
  'ES', // Spain
  'BR', // Brazil
  'MX', // Mexico
  'IN', // India
  'CN', // China
  'JP', // Japan
  'KR', // South Korea
  'SG', // Singapore
] as const;

export const CONTINENT_REGIONS = {
  'Africa': ['Northern Africa', 'Western Africa', 'Middle Africa', 'Eastern Africa', 'Southern Africa'],
  'Asia': ['Western Asia', 'Central Asia', 'Southern Asia', 'South-Eastern Asia', 'Eastern Asia'],
  'Europe': ['Northern Europe', 'Western Europe', 'Eastern Europe', 'Southern Europe'],
  'North America': ['Northern America', 'Central America', 'Caribbean'],
  'South America': ['South America'],
  'Oceania': ['Australia and New Zealand', 'Melanesia', 'Micronesia', 'Polynesia'],
  'Antarctica': ['Antarctica']
} as const;