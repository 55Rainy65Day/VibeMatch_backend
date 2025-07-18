# VibesMatch - Complete Implementation Plan

## Project Analysis

### Current State
The project has a solid foundation with:
- ✅ Complete database schema with all tables, relationships, and constraints
- ✅ Comprehensive reference data (countries, genders, interests, etc.)
- ✅ Row Level Security (RLS) policies for data protection
- ✅ TypeScript types for database and application interfaces
- ✅ Basic Supabase client setup
- ✅ Service classes for countries and reference data
- ✅ Basic React Native app structure with dependencies

### Missing Components
The following critical components need to be implemented:

1. **Authentication System** - Complete signup/login flow
2. **User Profile Management** - Profile creation, editing, photo upload
3. **Discovery Engine** - Core matching algorithm and profile browsing
4. **Match Request System** - Like/Super Like/Direct Message functionality
5. **Chat System** - Real-time messaging between matched users
6. **Payment Integration** - Stripe integration for Super Likes and Premium
7. **Notification System** - Push notifications and in-app notifications
8. **Admin/Moderation System** - Content moderation and user management
9. **Supabase Edge Functions** - Server-side business logic
10. **Navigation Structure** - Complete app navigation with tabs and screens
11. **UI Components** - Reusable components for consistent design
12. **State Management** - React Query setup for data fetching and caching

---

## Implementation Plan

### Phase 1: Core Infrastructure & Authentication

#### 1.1 Enhanced Type Definitions
**File: `src/types/api.ts`**
```typescript
// API response types, error handling, and request/response interfaces
export interface ApiResponse<T = any> {
  data?: T;
  error?: ApiError;
  success: boolean;
  message?: string;
}

export interface ApiError {
  code: string;
  message: string;
  details?: any;
  field?: string;
}

export interface PaginatedResponse<T> {
  data: T[];
  count: number;
  page: number;
  limit: number;
  hasMore: boolean;
}

// Request types for all API operations
export interface CreateMatchRequestPayload {
  receiverId: string;
  type: 'like' | 'super_like' | 'direct_message';
  message?: string;
}

export interface UpdateProfilePayload {
  name?: string;
  bio?: string;
  age?: number;
  // ... all other updatable fields
}
```

**File: `src/types/auth.ts`**
```typescript
// Authentication-specific types
export interface AuthState {
  user: AuthUser | null;
  session: Session | null;
  isLoading: boolean;
  isAuthenticated: boolean;
}

export interface LoginCredentials {
  email: string;
  password: string;
}

export interface SignupCredentials extends LoginCredentials {
  name: string;
}

export interface AuthError {
  message: string;
  code?: string;
}
```

**File: `src/types/navigation.ts`**
```typescript
// Complete navigation type definitions
export type RootStackParamList = {
  Auth: undefined;
  Onboarding: undefined;
  Main: undefined;
  Profile: { userId: string };
  Chat: { chatRoomId: string; matchId: string };
  PhotoViewer: { photos: string[]; initialIndex: number };
  SuperLikePurchase: undefined;
  PremiumUpgrade: undefined;
  Settings: undefined;
  EditProfile: undefined;
  Filters: undefined;
  Reports: { userId: string };
  BlockUser: { userId: string };
};

export type AuthStackParamList = {
  Welcome: undefined;
  Login: undefined;
  Signup: undefined;
  ForgotPassword: undefined;
};

export type OnboardingStackParamList = {
  BasicInfo: undefined;
  Photos: undefined;
  Interests: undefined;
  Preferences: undefined;
  Location: undefined;
  Lifestyle: undefined;
  Complete: undefined;
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
```

#### 1.2 Authentication Service
**File: `src/services/authService.ts`**
```typescript
// Complete authentication service with Supabase integration
export class AuthService {
  static async signUp(credentials: SignupCredentials): Promise<ApiResponse<AuthUser>>
  static async signIn(credentials: LoginCredentials): Promise<ApiResponse<AuthUser>>
  static async signOut(): Promise<ApiResponse<void>>
  static async resetPassword(email: string): Promise<ApiResponse<void>>
  static async updatePassword(newPassword: string): Promise<ApiResponse<void>>
  static async getCurrentUser(): Promise<AuthUser | null>
  static async refreshSession(): Promise<Session | null>
  
  // Session management
  static onAuthStateChange(callback: (user: AuthUser | null) => void): () => void
}
```

**File: `src/hooks/useAuth.ts`**
```typescript
// React hook for authentication state management
export function useAuth() {
  // Returns authentication state, login/logout functions, loading states
  // Integrates with React Query for caching and state management
}
```

#### 1.3 User Service
**File: `src/services/userService.ts`**
```typescript
// Complete user management service
export class UserService {
  static async createProfile(data: SignupData): Promise<ApiResponse<UserProfile>>
  static async updateProfile(updates: UserUpdate): Promise<ApiResponse<UserProfile>>
  static async getProfile(userId: string): Promise<ApiResponse<UserProfile>>
  static async getCurrentUserProfile(): Promise<ApiResponse<UserProfile>>
  static async uploadPhoto(uri: string, position: number): Promise<ApiResponse<Photo>>
  static async deletePhoto(photoId: string): Promise<ApiResponse<void>>
  static async reorderPhotos(photoIds: string[]): Promise<ApiResponse<Photo[]>>
  static async updateLocation(location: LocationData): Promise<ApiResponse<void>>
  static async updateSettings(settings: UserSettings): Promise<ApiResponse<void>>
  static async deleteAccount(): Promise<ApiResponse<void>>
  
  // Privacy and blocking
  static async blockUser(userId: string, reason?: string): Promise<ApiResponse<void>>
  static async unblockUser(userId: string): Promise<ApiResponse<void>>
  static async getBlockedUsers(): Promise<ApiResponse<User[]>>
  static async reportUser(userId: string, report: ReportData): Promise<ApiResponse<void>>
}
```

### Phase 2: Discovery Engine & Matching System

#### 2.1 Discovery Service
**File: `src/services/discoveryService.ts`**
```typescript
// Core discovery and matching algorithm
export class DiscoveryService {
  static async getDiscoveryProfiles(filters?: DiscoveryFilters): Promise<ApiResponse<DiscoveryProfile[]>>
  static async getProfileById(userId: string): Promise<ApiResponse<UserProfile>>
  static async recordProfileView(userId: string): Promise<ApiResponse<void>>
  static async getCompatibilityScore(userId: string): Promise<number>
  
  // Filtering and sorting
  static async applyFilters(profiles: UserProfile[], filters: DiscoveryFilters): Promise<UserProfile[]>
  static async sortByActivity(profiles: UserProfile[]): Promise<UserProfile[]>
  static async calculateDistance(user1: UserProfile, user2: UserProfile): Promise<number>
}
```

#### 2.2 Match Request Service
**File: `src/services/matchRequestService.ts`**
```typescript
// Handle all match request operations
export class MatchRequestService {
  static async sendLike(userId: string): Promise<ApiResponse<MatchRequest>>
  static async sendSuperLike(userId: string): Promise<ApiResponse<MatchRequest>>
  static async sendDirectMessage(userId: string, message: string): Promise<ApiResponse<MatchRequest>>
  static async acceptRequest(requestId: string): Promise<ApiResponse<Match>>
  static async declineRequest(requestId: string): Promise<ApiResponse<void>>
  static async cancelRequest(requestId: string): Promise<ApiResponse<void>>
  
  // Fetch requests
  static async getReceivedRequests(): Promise<ApiResponse<MatchRequestWithProfile[]>>
  static async getSentRequests(): Promise<ApiResponse<MatchRequestWithProfile[]>>
  static async getRequestById(requestId: string): Promise<ApiResponse<MatchRequestWithProfile>>
}
```

#### 2.3 Match Service
**File: `src/services/matchService.ts`**
```typescript
// Handle matches and match-related operations
export class MatchService {
  static async getMatches(): Promise<ApiResponse<MatchWithProfiles[]>>
  static async getMatchById(matchId: string): Promise<ApiResponse<MatchWithProfiles>>
  static async unmatch(matchId: string): Promise<ApiResponse<void>>
  static async getMatchStats(): Promise<ApiResponse<MatchStats>>
}
```

### Phase 3: Chat System & Real-time Communication

#### 3.1 Chat Service
**File: `src/services/chatService.ts`**
```typescript
// Complete chat functionality
export class ChatService {
  static async getChatRooms(): Promise<ApiResponse<ChatRoom[]>>
  static async getChatRoom(matchId: string): Promise<ApiResponse<ChatRoom>>
  static async getMessages(chatRoomId: string, page?: number): Promise<ApiResponse<PaginatedResponse<ChatMessage>>>
  static async sendMessage(chatRoomId: string, content: string, type?: MessageType): Promise<ApiResponse<Message>>
  static async sendMediaMessage(chatRoomId: string, mediaUri: string, type: MessageType): Promise<ApiResponse<Message>>
  static async markMessageAsRead(messageId: string): Promise<ApiResponse<void>>
  static async markAllMessagesAsRead(chatRoomId: string): Promise<ApiResponse<void>>
  
  // Real-time subscriptions
  static subscribeToMessages(chatRoomId: string, callback: (message: ChatMessage) => void): () => void
  static subscribeToTyping(chatRoomId: string, callback: (isTyping: boolean, userId: string) => void): () => void
}
```

#### 3.2 Media Service
**File: `src/services/mediaService.ts`**
```typescript
// Handle media upload and processing
export class MediaService {
  static async uploadImage(uri: string, folder: string): Promise<ApiResponse<string>>
  static async uploadVideo(uri: string, folder: string): Promise<ApiResponse<string>>
  static async uploadAudio(uri: string, folder: string): Promise<ApiResponse<string>>
  static async deleteMedia(url: string): Promise<ApiResponse<void>>
  static async generateThumbnail(videoUri: string): Promise<string>
  static async compressImage(uri: string, quality: number): Promise<string>
  static async getMediaMetadata(uri: string): Promise<MediaMetadata>
}
```

### Phase 4: Payment Integration

#### 4.1 Payment Service
**File: `src/services/paymentService.ts`**
```typescript
// Stripe integration for payments
export class PaymentService {
  static async createPaymentIntent(amount: number, type: PaymentType): Promise<ApiResponse<PaymentIntent>>
  static async confirmPayment(paymentIntentId: string): Promise<ApiResponse<Payment>>
  static async purchaseSuperLikes(quantity: number): Promise<ApiResponse<Payment>>
  static async subscribeToPremium(plan: PremiumPlan): Promise<ApiResponse<Payment>>
  static async cancelPremiumSubscription(): Promise<ApiResponse<void>>
  static async getPaymentHistory(): Promise<ApiResponse<Payment[]>>
  static async refundPayment(paymentId: string): Promise<ApiResponse<void>>
}
```

### Phase 5: Notification System

#### 5.1 Notification Service
**File: `src/services/notificationService.ts`**
```typescript
// Handle push and in-app notifications
export class NotificationService {
  static async registerForPushNotifications(): Promise<string | null>
  static async sendPushNotification(userId: string, notification: PushNotificationData): Promise<ApiResponse<void>>
  static async getNotifications(page?: number): Promise<ApiResponse<PaginatedResponse<Notification>>>
  static async markNotificationAsRead(notificationId: string): Promise<ApiResponse<void>>
  static async markAllNotificationsAsRead(): Promise<ApiResponse<void>>
  static async updateNotificationSettings(settings: NotificationSettings): Promise<ApiResponse<void>>
  
  // Real-time subscriptions
  static subscribeToNotifications(callback: (notification: Notification) => void): () => void
}
```

### Phase 6: Supabase Edge Functions

#### 6.1 Match Processing Function
**File: `supabase/functions/process-match-request/index.ts`**
```typescript
// Handle match request acceptance and match creation
// - Validate request exists and is pending
// - Create match record
// - Create chat room
// - Send notifications to both users
// - Update user statistics
```

#### 6.2 Payment Processing Function
**File: `supabase/functions/process-payment/index.ts`**
```typescript
// Handle Stripe webhook events
// - Verify webhook signature
// - Process successful payments
// - Update user premium status or super likes count
// - Handle failed payments and refunds
// - Send confirmation notifications
```

#### 6.3 Discovery Algorithm Function
**File: `supabase/functions/get-discovery-profiles/index.ts`**
```typescript
// Advanced discovery algorithm
// - Apply user preferences and filters
// - Calculate compatibility scores
// - Sort by activity and relevance
// - Exclude already interacted users
// - Apply distance-based filtering
// - Return paginated results
```

#### 6.4 Notification Dispatcher Function
**File: `supabase/functions/send-notification/index.ts`**
```typescript
// Send push notifications via Expo
// - Handle different notification types
// - Respect user notification preferences
// - Queue notifications for offline users
// - Track delivery status
```

#### 6.5 Moderation Function
**File: `supabase/functions/moderate-content/index.ts`**
```typescript
// Content moderation and admin actions
// - Process user reports
// - Automatic content filtering
// - Admin action processing (bans, warnings)
// - Evidence collection and storage
```

#### 6.6 Analytics Function
**File: `supabase/functions/track-analytics/index.ts`**
```typescript
// Track user behavior and app analytics
// - User engagement metrics
// - Match success rates
// - Feature usage statistics
// - Performance monitoring
```

### Phase 7: React Native Screens & Navigation

#### 7.1 Navigation Structure
**File: `src/navigation/RootNavigator.tsx`**
```typescript
// Main navigation container with authentication flow
export function RootNavigator() {
  // Handle authentication state
  // Route to Auth, Onboarding, or Main stack based on user state
}
```

**File: `src/navigation/AuthNavigator.tsx`**
```typescript
// Authentication flow navigation
export function AuthNavigator() {
  // Welcome, Login, Signup, ForgotPassword screens
}
```

**File: `src/navigation/OnboardingNavigator.tsx`**
```typescript
// User onboarding flow navigation
export function OnboardingNavigator() {
  // Multi-step profile creation process
}
```

**File: `src/navigation/MainNavigator.tsx`**
```typescript
// Main app tab navigation
export function MainNavigator() {
  // Discovery, Messages, Profile, Search tabs
}
```

#### 7.2 Authentication Screens
**File: `src/screens/auth/WelcomeScreen.tsx`**
```typescript
// App introduction and authentication options
export default function WelcomeScreen() {
  // Beautiful welcome screen with app branding
  // Login and Signup buttons
  // Terms of service and privacy policy links
}
```

**File: `src/screens/auth/LoginScreen.tsx`**
```typescript
// User login form
export default function LoginScreen() {
  // Email and password input
  // Form validation
  // Loading states
  // Error handling
  // Forgot password link
}
```

**File: `src/screens/auth/SignupScreen.tsx`**
```typescript
// User registration form
export default function SignupScreen() {
  // Email, password, and basic info
  // Form validation
  // Terms acceptance
  // Navigate to onboarding on success
}
```

#### 7.3 Onboarding Screens
**File: `src/screens/onboarding/BasicInfoScreen.tsx`**
```typescript
// Collect basic user information
export default function BasicInfoScreen() {
  // Name, age, gender selection
  // Location input with country/state/city
  // Progress indicator
  // Form validation
}
```

**File: `src/screens/onboarding/PhotosScreen.tsx`**
```typescript
// Photo upload interface
export default function PhotosScreen() {
  // Photo picker integration
  // Drag and drop reordering
  // Photo preview and editing
  // Minimum photo requirements
}
```

**File: `src/screens/onboarding/InterestsScreen.tsx`**
```typescript
// Interest selection interface
export default function InterestsScreen() {
  // Categorized interest selection
  // Search functionality
  // Visual interest tags
  // Minimum selection requirements
}
```

**File: `src/screens/onboarding/PreferencesScreen.tsx`**
```typescript
// Dating preferences setup
export default function PreferencesScreen() {
  // Age range slider
  // Gender preferences
  // Relationship type selection
  // Looking for options
}
```

**File: `src/screens/onboarding/LifestyleScreen.tsx`**
```typescript
// Lifestyle information collection
export default function LifestyleScreen() {
  // Exercise, education, job, drinking, smoking
  // Kids preferences
  // Ethnicity and religion (optional)
  // Personality type selection
}
```

#### 7.4 Main App Screens
**File: `src/screens/discovery/DiscoveryScreen.tsx`**
```typescript
// Main profile discovery interface
export default function DiscoveryScreen() {
  // Profile card stack
  // Like, Super Like, Dislike, Message buttons
  // Profile details modal
  // Filter button
  // Loading states and empty states
}
```

**File: `src/screens/discovery/ProfileDetailScreen.tsx`**
```typescript
// Detailed profile view
export default function ProfileDetailScreen() {
  // Full profile information display
  // Photo gallery with swipe
  // Interest tags
  // Lifestyle information
  // Action buttons (Like, Super Like, Message)
}
```

**File: `src/screens/messages/ChatsScreen.tsx`**
```typescript
// Chat list interface
export default function ChatsScreen() {
  // List of active conversations
  // Last message preview
  // Unread message indicators
  // Search functionality
  // Empty state for no chats
}
```

**File: `src/screens/messages/RequestsScreen.tsx`**
```typescript
// Match requests interface
export default function RequestsScreen() {
  // Received requests list
  // Super Like priority sorting
  // Accept/Decline actions
  // Request details modal
  // Empty state handling
}
```

**File: `src/screens/messages/ChatScreen.tsx`**
```typescript
// Individual chat interface
export default function ChatScreen() {
  // Message list with real-time updates
  // Message input with media options
  // Typing indicators
  // Read receipts (premium feature)
  // Media message handling
}
```

**File: `src/screens/profile/ProfileScreen.tsx`**
```typescript
// User's own profile view
export default function ProfileScreen() {
  // Profile information display
  // Edit profile button
  // Settings access
  // Premium upgrade options
  // Statistics (matches, views, etc.)
}
```

**File: `src/screens/profile/EditProfileScreen.tsx`**
```typescript
// Profile editing interface
export default function EditProfileScreen() {
  // Editable profile fields
  // Photo management
  // Interest editing
  // Preference updates
  // Save/cancel actions
}
```

### Phase 8: UI Components Library

#### 8.1 Core Components
**File: `src/components/ui/Button.tsx`**
```typescript
// Reusable button component with variants
export interface ButtonProps {
  variant: 'primary' | 'secondary' | 'outline' | 'ghost';
  size: 'small' | 'medium' | 'large';
  onPress: () => void;
  children: React.ReactNode;
  disabled?: boolean;
  loading?: boolean;
}
```

**File: `src/components/ui/Input.tsx`**
```typescript
// Styled input component with validation
export interface InputProps {
  label?: string;
  placeholder?: string;
  value: string;
  onChangeText: (text: string) => void;
  error?: string;
  secureTextEntry?: boolean;
  keyboardType?: KeyboardTypeOptions;
}
```

**File: `src/components/ui/Card.tsx`**
```typescript
// Reusable card component for profiles and content
export interface CardProps {
  children: React.ReactNode;
  onPress?: () => void;
  style?: ViewStyle;
  shadow?: boolean;
}
```

#### 8.2 Specialized Components
**File: `src/components/profile/ProfileCard.tsx`**
```typescript
// Profile card for discovery screen
export interface ProfileCardProps {
  profile: UserProfile;
  onLike: () => void;
  onSuperLike: () => void;
  onDislike: () => void;
  onMessage: () => void;
  onViewProfile: () => void;
}
```

**File: `src/components/profile/PhotoGallery.tsx`**
```typescript
// Photo gallery with swipe navigation
export interface PhotoGalleryProps {
  photos: Photo[];
  initialIndex?: number;
  onPhotoChange?: (index: number) => void;
  editable?: boolean;
  onReorder?: (photos: Photo[]) => void;
  onDelete?: (photoId: string) => void;
}
```

**File: `src/components/chat/MessageBubble.tsx`**
```typescript
// Individual message component
export interface MessageBubbleProps {
  message: ChatMessage;
  isOwn: boolean;
  showTimestamp?: boolean;
  showReadReceipt?: boolean;
  onMediaPress?: () => void;
}
```

**File: `src/components/interests/InterestSelector.tsx`**
```typescript
// Interest selection component
export interface InterestSelectorProps {
  interests: InterestData[];
  selectedInterests: string[];
  onSelectionChange: (interestIds: string[]) => void;
  maxSelection?: number;
  searchable?: boolean;
}
```

### Phase 9: Custom Hooks

#### 9.1 Data Fetching Hooks
**File: `src/hooks/useDiscovery.ts`**
```typescript
// Hook for discovery profiles and filtering
export function useDiscovery(filters?: DiscoveryFilters) {
  // React Query integration for discovery data
  // Infinite scrolling support
  // Filter management
  // Loading and error states
}
```

**File: `src/hooks/useMatchRequests.ts`**
```typescript
// Hook for match request management
export function useMatchRequests() {
  // Fetch received and sent requests
  // Real-time updates
  // Optimistic updates for actions
  // Request status management
}
```

**File: `src/hooks/useChat.ts`**
```typescript
// Hook for chat functionality
export function useChat(chatRoomId: string) {
  // Message fetching with pagination
  // Real-time message subscriptions
  // Typing indicators
  // Message sending with optimistic updates
}
```

#### 9.2 Feature Hooks
**File: `src/hooks/useLocation.ts`**
```typescript
// Hook for location services
export function useLocation() {
  // Get current location
  // Location permissions
  // Distance calculations
  // Location updates
}
```

**File: `src/hooks/useNotifications.ts`**
```typescript
// Hook for notification management
export function useNotifications() {
  // Push notification registration
  // In-app notification handling
  // Notification preferences
  // Real-time notification updates
}
```

**File: `src/hooks/usePremium.ts`**
```typescript
// Hook for premium features
export function usePremium() {
  // Premium status checking
  // Feature availability
  // Upgrade prompts
  // Usage tracking
}
```

### Phase 10: Utility Functions

#### 10.1 Helper Functions
**File: `src/utils/validation.ts`**
```typescript
// Form validation utilities
export const validateEmail = (email: string): boolean => { /* ... */ }
export const validatePassword = (password: string): ValidationResult => { /* ... */ }
export const validateAge = (age: number): boolean => { /* ... */ }
export const validateBio = (bio: string): ValidationResult => { /* ... */ }
```

**File: `src/utils/formatting.ts`**
```typescript
// Data formatting utilities
export const formatDistance = (distance: number): string => { /* ... */ }
export const formatLastSeen = (timestamp: string): string => { /* ... */ }
export const formatMessageTime = (timestamp: string): string => { /* ... */ }
export const formatAge = (birthDate: string): number => { /* ... */ }
```

**File: `src/utils/permissions.ts`**
```typescript
// Permission handling utilities
export const requestCameraPermission = (): Promise<boolean> => { /* ... */ }
export const requestLocationPermission = (): Promise<boolean> => { /* ... */ }
export const requestNotificationPermission = (): Promise<boolean> => { /* ... */ }
```

**File: `src/utils/constants.ts`**
```typescript
// App-wide constants
export const APP_CONFIG = {
  MAX_PHOTOS: 6,
  MIN_PHOTOS: 2,
  MAX_BIO_LENGTH: 500,
  MIN_AGE: 18,
  MAX_AGE: 100,
  DAILY_LIKES_LIMIT: 20,
  SUPER_LIKE_PRIORITY_HOURS: 48,
  // ... other constants
}
```

### Phase 11: State Management & Context

#### 11.1 Context Providers
**File: `src/context/AuthContext.tsx`**
```typescript
// Authentication context provider
export const AuthProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  // Manage authentication state
  // Provide auth methods to components
  // Handle session persistence
}
```

**File: `src/context/ThemeContext.tsx`**
```typescript
// Theme management context
export const ThemeProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  // Light/dark theme switching
  // System theme detection
  // Theme persistence
}
```

**File: `src/context/NotificationContext.tsx`**
```typescript
// Notification context provider
export const NotificationProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  // In-app notification display
  // Notification queue management
  // Toast notifications
}
```

### Phase 12: Configuration & Environment

#### 12.1 App Configuration
**File: `src/config/app.ts`**
```typescript
// App configuration based on environment
export const APP_CONFIG = {
  API_URL: process.env.EXPO_PUBLIC_SUPABASE_URL,
  STRIPE_PUBLISHABLE_KEY: process.env.EXPO_PUBLIC_STRIPE_PUBLISHABLE_KEY,
  SENTRY_DSN: process.env.EXPO_PUBLIC_SENTRY_DSN,
  // ... other config
}
```

**File: `src/config/theme.ts`**
```typescript
// Theme configuration
export const lightTheme = {
  colors: {
    primary: '#FF6B6B',
    secondary: '#4ECDC4',
    background: '#FFFFFF',
    surface: '#F8F9FA',
    // ... complete color palette
  },
  typography: {
    // Font sizes, weights, line heights
  },
  spacing: {
    // 8px spacing system
  }
}

export const darkTheme = {
  // Dark theme variant
}
```

### Phase 13: Testing Infrastructure

#### 13.1 Test Setup
**File: `src/__tests__/setup.ts`**
```typescript
// Test environment setup
// Mock configurations
// Test utilities
```

**File: `src/__tests__/services/authService.test.ts`**
```typescript
// Authentication service tests
// Mock Supabase responses
// Test all auth flows
```

**File: `src/__tests__/components/ProfileCard.test.tsx`**
```typescript
// Component testing with React Native Testing Library
// User interaction testing
// Snapshot testing
```

### Phase 14: Performance Optimization

#### 14.1 Optimization Utilities
**File: `src/utils/performance.ts`**
```typescript
// Performance optimization utilities
export const debounce = (func: Function, delay: number) => { /* ... */ }
export const throttle = (func: Function, limit: number) => { /* ... */ }
export const memoizeWithExpiry = (func: Function, ttl: number) => { /* ... */ }
```

**File: `src/hooks/useInfiniteScroll.ts`**
```typescript
// Infinite scrolling hook for discovery and chat
export function useInfiniteScroll<T>(
  fetchFunction: (page: number) => Promise<PaginatedResponse<T>>,
  options?: InfiniteScrollOptions
) {
  // Implement infinite scrolling with React Query
  // Handle loading states and error recovery
}
```

---

## Implementation Priority & Timeline

### Week 1-2: Foundation
1. Complete type definitions (api.ts, auth.ts, navigation.ts)
2. Authentication service and hooks
3. Basic navigation structure
4. Authentication screens (Welcome, Login, Signup)

### Week 3-4: Core Features
1. User service and profile management
2. Onboarding flow screens
3. Basic UI component library
4. Photo upload functionality

### Week 5-6: Discovery Engine
1. Discovery service implementation
2. Discovery screen and profile cards
3. Match request service
4. Like/Super Like functionality

### Week 7-8: Chat System
1. Chat service with real-time features
2. Chat screens and message components
3. Media message support
4. Notification integration

### Week 9-10: Advanced Features
1. Payment integration with Stripe
2. Premium features implementation
3. Admin/moderation system
4. Advanced filtering and search

### Week 11-12: Edge Functions & Backend Logic
1. All Supabase Edge Functions
2. Webhook handling
3. Background job processing
4. Analytics and monitoring

### Week 13-14: Polish & Testing
1. Comprehensive testing suite
2. Performance optimization
3. UI/UX refinements
4. Bug fixes and edge cases

### Week 15-16: Production Preparation
1. Security audit
2. Performance testing
3. App store preparation
4. Documentation completion

---

## Technical Considerations

### Security
- Implement proper input validation on all forms
- Use Supabase RLS policies effectively
- Secure media upload with signed URLs
- Implement rate limiting for API calls
- Add CSRF protection for sensitive operations

### Performance
- Implement image caching and optimization
- Use React Query for efficient data fetching
- Implement proper pagination for large datasets
- Optimize database queries with proper indexing
- Use React Native's performance best practices

### Scalability
- Design for horizontal scaling
- Implement proper error handling and retry logic
- Use background job processing for heavy operations
- Implement proper logging and monitoring
- Design for offline functionality where appropriate

### User Experience
- Implement smooth animations and transitions
- Provide clear loading states and error messages
- Design for accessibility (screen readers, etc.)
- Implement proper keyboard navigation
- Provide helpful onboarding and tutorials

---

## Success Metrics

### Technical Metrics
- App startup time < 3 seconds
- API response time < 500ms for 95% of requests
- Crash rate < 0.1%
- Memory usage optimization
- Battery usage optimization

### Business Metrics
- User registration completion rate > 80%
- Daily active user retention > 40%
- Match success rate > 15%
- Premium conversion rate > 5%
- User satisfaction score > 4.5/5

---

## Conclusion

This implementation plan provides a comprehensive roadmap for building VibesMatch into a production-ready dating application. The plan is structured to build incrementally, with each phase building upon the previous one. The focus is on creating a robust, scalable, and user-friendly application that leverages the strong database foundation already in place.

The key to success will be maintaining code quality, implementing proper testing, and focusing on user experience throughout the development process. Regular code reviews, performance monitoring, and user feedback integration will be essential for delivering a high-quality product.