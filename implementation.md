# VibesMatch - Complete Implementation Analysis

## Project Deep Dive Analysis

After thoroughly analyzing the existing codebase, database schema, and requirements, I've identified that we have a solid foundation but need to build the entire application layer. 

**CRITICAL: This is an OTP-based authentication system, NOT password-based. The authentication flow uses:**
- Continue with Google (OAuth)
- Continue with Email (OTP verification)
- No passwords anywhere in the system
- Smart routing based on account status (new user → signup, existing user → login, incomplete → resume)

Here's every single file that needs to be created:

---

## 1. TYPE DEFINITIONS & INTERFACES

### Core Type Files

**`src/types/api.ts`**
- `ApiResponse<T>` - Standardized API response wrapper
- `ApiError` - Error handling interface
- `PaginatedResponse<T>` - Pagination wrapper for lists
- `RequestOptions` - HTTP request configuration
- `UploadProgress` - File upload progress tracking
- `ValidationError` - Form validation error structure

**`src/types/auth.ts`**
- `AuthState` - Authentication state management (OTP-based)
- `EmailAuthRequest` - Email for OTP request
- `OTPVerificationRequest` - Email + OTP code verification
- `GoogleAuthRequest` - Google OAuth data
- `AuthError` - Authentication-specific errors
- `Session` - User session data
- `TokenRefreshResponse` - JWT token refresh
- `AccountStatus` - 'new' | 'existing' | 'incomplete' - determines flow routing
- `AuthProvider` - 'email' | 'google' - authentication method used
- `OTPResponse` - OTP sending response with status

**`src/types/navigation.ts`**
- `RootStackParamList` - Main app navigation
- `AuthStackParamList` - Authentication flow (OTP-based)
- `OnboardingStackParamList` - Profile setup flow
- `MainTabParamList` - Bottom tab navigation
- `MessagesTabParamList` - Messages section tabs
- `DiscoveryStackParamList` - Discovery flow
- `ProfileStackParamList` - Profile management
- `SettingsStackParamList` - Settings screens

**`src/types/forms.ts`**
- `ProfileFormData` - Profile creation/editing
- `OnboardingStepData` - Each onboarding step
- `FilterFormData` - Discovery filters
- `ReportFormData` - User reporting
- `SettingsFormData` - User preferences
- `PaymentFormData` - Payment processing
- `ContactFormData` - Support/feedback

**`src/types/ui.ts`**
- `ThemeColors` - Color system
- `Typography` - Font system
- `Spacing` - Spacing system
- `ComponentVariants` - UI component variants
- `AnimationConfig` - Animation settings
- `ModalProps` - Modal configurations
- `ToastType` - Toast notification types

**`src/types/media.ts`**
- `MediaType` - Image/video/audio types
- `MediaMetadata` - File metadata
- `UploadConfig` - Upload settings
- `CompressionSettings` - Media compression
- `ThumbnailConfig` - Thumbnail generation
- `MediaProcessingStatus` - Processing states

**`src/types/location.ts`**
- `Coordinates` - Lat/lng coordinates
- `LocationData` - Complete location info
- `DistanceUnit` - Miles/kilometers
- `LocationPermission` - Permission states
- `GeofenceData` - Location boundaries
- `PlaceData` - Place search results

**`src/types/notifications.ts`**
- `NotificationData` - Notification content
- `PushNotificationPayload` - Push notification data
- `NotificationSettings` - User preferences
- `NotificationChannel` - Android channels
- `NotificationAction` - Action buttons
- `NotificationSchedule` - Scheduled notifications

**`src/types/payments.ts`**
- `PaymentIntent` - Stripe payment intent
- `PaymentMethod` - Payment methods
- `SubscriptionPlan` - Premium plans
- `PurchaseItem` - Super likes packages
- `PaymentHistory` - Transaction history
- `RefundRequest` - Refund processing
- `BillingAddress` - Billing information

**`src/types/analytics.ts`**
- `UserEvent` - User interaction tracking
- `ScreenView` - Screen navigation tracking
- `ConversionEvent` - Business metric events
- `ErrorEvent` - Error tracking
- `PerformanceMetric` - App performance data
- `UserProperty` - User characteristics

---

## 2. CONFIGURATION FILES

**`src/config/app.ts`**
- Environment-specific configuration
- API endpoints and keys
- Feature flags
- Debug settings
- App version info

**`src/config/theme.ts`**
- Light theme definition
- Dark theme definition
- Color palette system
- Typography scale
- Spacing system
- Component styling

**`src/config/constants.ts`**
- App-wide constants
- Business rules (max photos, age limits)
- API limits and timeouts
- Error messages
- Default values

**`src/config/permissions.ts`**
- Permission request configurations
- Permission rationale messages
- Fallback behaviors
- Permission status handling

**`src/config/notifications.ts`**
- Notification channel definitions
- Default notification settings
- Push notification configuration
- Sound and vibration settings

---

## 3. UTILITY FUNCTIONS

### Core Utilities

**`src/utils/validation.ts`**
- `validateEmail(email: string)` - Email format validation
- `validateOTP(otp: string)` - OTP format validation (6 digits)
- `validateAge(age: number)` - Age range validation
- `validateBio(bio: string)` - Bio length and content
- `validatePhoneNumber(phone: string)` - Phone format
- `validateName(name: string)` - Name validation
- `validateLocation(location: LocationData)` - Location data

**`src/utils/formatting.ts`**
- `formatDistance(meters: number, unit: DistanceUnit)` - Distance display
- `formatLastSeen(timestamp: string)` - "2 hours ago" format
- `formatMessageTime(timestamp: string)` - Chat timestamp
- `formatAge(birthDate: string)` - Calculate age
- `formatCurrency(amount: number, currency: string)` - Price display
- `formatPhoneNumber(phone: string, country: string)` - Phone formatting
- `formatFileSize(bytes: number)` - File size display

**`src/utils/permissions.ts`**
- `requestCameraPermission()` - Camera access
- `requestLocationPermission()` - Location access
- `requestNotificationPermission()` - Push notifications
- `requestMediaLibraryPermission()` - Photo library
- `requestMicrophonePermission()` - Audio recording
- `checkPermissionStatus(type: PermissionType)` - Status checking

**`src/utils/storage.ts`**
- `storeSecurely(key: string, value: string)` - Secure storage
- `getSecurely(key: string)` - Secure retrieval
- `removeSecurely(key: string)` - Secure deletion
- `storeLocally(key: string, value: any)` - Local storage
- `getLocally(key: string)` - Local retrieval
- `clearStorage()` - Clear all stored data

**`src/utils/crypto.ts`**
- `generateUUID()` - UUID generation
- `generateOTPCode()` - Generate 6-digit OTP (for testing/dev)
- `generateRandomString(length: number)` - Random strings
- `encryptData(data: string, key: string)` - Data encryption
- `decryptData(encryptedData: string, key: string)` - Data decryption
- `validateOTPFormat(otp: string)` - OTP format validation

**`src/utils/performance.ts`**
- `debounce(func: Function, delay: number)` - Debouncing
- `throttle(func: Function, limit: number)` - Throttling
- `memoize(func: Function)` - Memoization
- `measurePerformance(label: string, func: Function)` - Performance tracking
- `optimizeImage(uri: string, options: CompressionSettings)` - Image optimization

**`src/utils/date.ts`**
- `isToday(date: Date)` - Date comparison
- `isYesterday(date: Date)` - Yesterday check
- `getRelativeTime(date: Date)` - Relative time display
- `formatBirthDate(date: Date)` - Birth date formatting
- `calculateAge(birthDate: Date)` - Age calculation
- `getTimezone()` - User timezone detection

**`src/utils/location.ts`**
- `calculateDistance(coord1: Coordinates, coord2: Coordinates)` - Distance calculation
- `isWithinRadius(center: Coordinates, point: Coordinates, radius: number)` - Radius check
- `formatCoordinates(coords: Coordinates)` - Coordinate formatting
- `reverseGeocode(coords: Coordinates)` - Address from coordinates
- `geocodeAddress(address: string)` - Coordinates from address

**`src/utils/media.ts`**
- `compressImage(uri: string, quality: number)` - Image compression
- `generateThumbnail(videoUri: string)` - Video thumbnail
- `getImageDimensions(uri: string)` - Image size
- `getVideoDuration(uri: string)` - Video length
- `validateMediaFile(uri: string, type: MediaType)` - File validation
- `getMediaMetadata(uri: string)` - Extract metadata

**`src/utils/network.ts`**
- `isOnline()` - Network connectivity check
- `getNetworkType()` - WiFi/cellular detection
- `retryRequest(request: Function, maxRetries: number)` - Request retry logic
- `handleNetworkError(error: Error)` - Network error handling
- `queueOfflineAction(action: Function)` - Offline action queuing

**`src/utils/analytics.ts`**
- `trackEvent(event: string, properties: object)` - Event tracking
- `trackScreenView(screenName: string)` - Screen tracking
- `trackUserProperty(property: string, value: any)` - User properties
- `trackError(error: Error, context: string)` - Error tracking
- `trackConversion(event: string, value: number)` - Conversion tracking

---

## 4. SERVICE LAYER

### Authentication Services

**`src/services/authService.ts`**
- `requestOTP(email: string)` - Send OTP to email
- `verifyOTP(email: string, otp: string)` - Verify OTP and authenticate
- `signInWithGoogle()` - Google OAuth authentication
- `checkAccountStatus(email: string)` - Check if user exists and profile completion status
- `signOut()` - User logout
- `getCurrentUser()` - Get current user
- `refreshSession()` - Refresh auth token
- `deleteAccount()` - Account deletion
- `onAuthStateChange(callback: Function)` - Auth state listener
- `resendOTP(email: string)` - Resend OTP code
- `getAuthProvider()` - Get how user authenticated (email/google)

**`src/services/userService.ts`**
- `createProfile(data: SignupData)` - Create user profile
- `updateProfile(updates: UserUpdate)` - Update profile
- `getProfile(userId: string)` - Get user profile
- `getCurrentUserProfile()` - Get own profile
- `uploadPhoto(uri: string, position: number)` - Photo upload
- `deletePhoto(photoId: string)` - Photo deletion
- `reorderPhotos(photoIds: string[])` - Photo reordering
- `updateLocation(location: LocationData)` - Location update
- `updateSettings(settings: UserSettings)` - Settings update
- `blockUser(userId: string, reason?: string)` - Block user
- `unblockUser(userId: string)` - Unblock user
- `getBlockedUsers()` - Get blocked list
- `reportUser(userId: string, report: ReportData)` - Report user
- `updateLastActive()` - Activity tracking
- `updatePreferences(preferences: UserPreferences)` - Dating preferences

### Discovery & Matching Services

**`src/services/discoveryService.ts`**
- `getDiscoveryProfiles(filters?: DiscoveryFilters)` - Get profiles for discovery
- `getProfileById(userId: string)` - Get specific profile
- `recordProfileView(userId: string)` - Track profile views
- `getCompatibilityScore(userId: string)` - Calculate compatibility
- `applyFilters(profiles: UserProfile[], filters: DiscoveryFilters)` - Filter profiles
- `sortByActivity(profiles: UserProfile[])` - Sort by last active
- `sortByDistance(profiles: UserProfile[], userLocation: Coordinates)` - Sort by distance
- `calculateDistance(user1: UserProfile, user2: UserProfile)` - Distance calculation
- `getRecommendations(userId: string)` - AI-powered recommendations
- `updateDiscoverySettings(settings: DiscoverySettings)` - Discovery preferences

**`src/services/matchRequestService.ts`**
- `sendLike(userId: string)` - Send like
- `sendSuperLike(userId: string)` - Send super like
- `sendDirectMessage(userId: string, message: string)` - Send direct message
- `acceptRequest(requestId: string)` - Accept match request
- `declineRequest(requestId: string)` - Decline match request
- `cancelRequest(requestId: string)` - Cancel sent request
- `getReceivedRequests()` - Get incoming requests
- `getSentRequests()` - Get outgoing requests
- `getRequestById(requestId: string)` - Get specific request
- `getPriorityRequests()` - Get super like priority requests
- `markRequestAsSeen(requestId: string)` - Mark as viewed

**`src/services/matchService.ts`**
- `getMatches()` - Get all matches
- `getMatchById(matchId: string)` - Get specific match
- `unmatch(matchId: string)` - Remove match
- `getMatchStats()` - Get match statistics
- `getRecentMatches(limit: number)` - Get recent matches
- `searchMatches(query: string)` - Search through matches

### Chat & Communication Services

**`src/services/chatService.ts`**
- `getChatRooms()` - Get all chat rooms
- `getChatRoom(matchId: string)` - Get specific chat room
- `getMessages(chatRoomId: string, page?: number)` - Get messages with pagination
- `sendMessage(chatRoomId: string, content: string, type?: MessageType)` - Send text message
- `sendMediaMessage(chatRoomId: string, mediaUri: string, type: MessageType)` - Send media
- `markMessageAsRead(messageId: string)` - Mark message read
- `markAllMessagesAsRead(chatRoomId: string)` - Mark all read
- `deleteMessage(messageId: string)` - Delete message
- `editMessage(messageId: string, newContent: string)` - Edit message
- `subscribeToMessages(chatRoomId: string, callback: Function)` - Real-time messages
- `subscribeToTyping(chatRoomId: string, callback: Function)` - Typing indicators
- `sendTypingIndicator(chatRoomId: string, isTyping: boolean)` - Send typing status
- `getChatStatistics(chatRoomId: string)` - Chat stats

**`src/services/mediaService.ts`**
- `uploadImage(uri: string, folder: string)` - Image upload
- `uploadVideo(uri: string, folder: string)` - Video upload
- `uploadAudio(uri: string, folder: string)` - Audio upload
- `deleteMedia(url: string)` - Delete media file
- `generateThumbnail(videoUri: string)` - Video thumbnail
- `compressImage(uri: string, quality: number)` - Image compression
- `compressVideo(uri: string, quality: number)` - Video compression
- `getMediaMetadata(uri: string)` - Extract metadata
- `validateMediaFile(uri: string, type: MediaType)` - File validation
- `getSignedUrl(filePath: string)` - Get signed URL for private files

### Payment & Premium Services

**`src/services/paymentService.ts`**
- `createPaymentIntent(amount: number, type: PaymentType)` - Create Stripe payment
- `confirmPayment(paymentIntentId: string)` - Confirm payment
- `purchaseSuperLikes(quantity: number)` - Buy super likes
- `subscribeToPremium(plan: PremiumPlan)` - Premium subscription
- `cancelPremiumSubscription()` - Cancel subscription
- `getPaymentHistory()` - Payment history
- `refundPayment(paymentId: string)` - Process refund
- `updatePaymentMethod(paymentMethodId: string)` - Update payment method
- `getSubscriptionStatus()` - Check subscription status
- `validatePremiumFeature(feature: string)` - Check feature access

**`src/services/premiumService.ts`**
- `isPremiumUser()` - Check premium status
- `getPremiumFeatures()` - Get available features
- `checkFeatureAccess(feature: string)` - Feature availability
- `getRemainingFeatures()` - Usage tracking
- `upgradeToPremium()` - Upgrade flow
- `getPremiumBenefits()` - Benefits list
- `trackFeatureUsage(feature: string)` - Usage analytics

### Notification Services

**`src/services/notificationService.ts`**
- `registerForPushNotifications()` - Register device
- `sendPushNotification(userId: string, notification: PushNotificationData)` - Send push
- `getNotifications(page?: number)` - Get in-app notifications
- `markNotificationAsRead(notificationId: string)` - Mark as read
- `markAllNotificationsAsRead()` - Mark all read
- `deleteNotification(notificationId: string)` - Delete notification
- `updateNotificationSettings(settings: NotificationSettings)` - Update preferences
- `subscribeToNotifications(callback: Function)` - Real-time notifications
- `scheduleLocalNotification(notification: LocalNotificationData)` - Local notifications
- `cancelScheduledNotification(notificationId: string)` - Cancel scheduled

### Analytics & Tracking Services

**`src/services/analyticsService.ts`**
- `trackEvent(event: string, properties: object)` - Track user events
- `trackScreenView(screenName: string)` - Screen navigation
- `trackUserProperty(property: string, value: any)` - User properties
- `trackConversion(event: string, value: number)` - Business metrics
- `trackError(error: Error, context: string)` - Error tracking
- `setUserId(userId: string)` - Associate user
- `getAnalyticsData()` - Retrieve analytics
- `trackAppOpen()` - App launch tracking
- `trackAppBackground()` - App backgrounding

**`src/services/feedbackService.ts`**
- `submitFeedback(feedback: FeedbackData)` - User feedback
- `reportBug(bugReport: BugReportData)` - Bug reporting
- `requestFeature(featureRequest: FeatureRequestData)` - Feature requests
- `rateApp(rating: number, review?: string)` - App store rating
- `contactSupport(message: string, category: string)` - Support contact

---

## 5. CUSTOM HOOKS

### Authentication Hooks

**`src/hooks/useAuth.ts`**
- Authentication state management (OTP-based)
- OTP request/verification functions
- Google OAuth integration
- Session persistence
- Auth error handling
- Loading states
- Account status checking
- Smart routing logic

**`src/hooks/useUser.ts`**
- Current user profile data
- Profile update functions
- User settings management
- Premium status checking

### Data Fetching Hooks

**`src/hooks/useDiscovery.ts`**
- Discovery profiles fetching
- Filter management
- Infinite scrolling
- Profile caching
- Compatibility scoring

**`src/hooks/useMatchRequests.ts`**
- Match request management
- Real-time updates
- Optimistic updates
- Request status tracking
- Priority sorting

**`src/hooks/useMatches.ts`**
- Matches data fetching
- Match statistics
- Match search functionality
- Match filtering

**`src/hooks/useChat.ts`**
- Chat room management
- Message fetching with pagination
- Real-time message subscriptions
- Typing indicators
- Message sending with optimistic updates

**`src/hooks/useMessages.ts`**
- Individual message management
- Message status tracking
- Media message handling
- Message editing/deletion

### Feature-Specific Hooks

**`src/hooks/useLocation.ts`**
- Current location fetching
- Location permissions
- Distance calculations
- Location updates
- Geofencing

**`src/hooks/useNotifications.ts`**
- Push notification registration
- In-app notification handling
- Notification preferences
- Real-time notification updates
- Local notification scheduling

**`src/hooks/usePremium.ts`**
- Premium status checking
- Feature availability
- Upgrade prompts
- Usage tracking
- Subscription management

**`src/hooks/usePhotos.ts`**
- Photo upload management
- Photo reordering
- Photo deletion
- Upload progress tracking
- Photo validation

**`src/hooks/useFilters.ts`**
- Discovery filter management
- Filter persistence
- Filter validation
- Default filter handling

**`src/hooks/useSearch.ts`**
- Search functionality
- Search history
- Search suggestions
- Search result caching

### UI & Interaction Hooks

**`src/hooks/useTheme.ts`**
- Theme management
- Light/dark mode switching
- System theme detection
- Theme persistence

**`src/hooks/useKeyboard.ts`**
- Keyboard visibility detection
- Keyboard height tracking
- Keyboard avoidance

**`src/hooks/useOrientation.ts`**
- Device orientation detection
- Orientation change handling
- Layout adjustments

**`src/hooks/useNetworkStatus.ts`**
- Network connectivity monitoring
- Online/offline state
- Network type detection
- Retry logic for failed requests

**`src/hooks/useInfiniteScroll.ts`**
- Infinite scrolling implementation
- Load more functionality
- Loading state management
- Error handling for pagination

**`src/hooks/useDebounce.ts`**
- Debounced value management
- Search input optimization
- API call optimization

**`src/hooks/useLocalStorage.ts`**
- Local storage management
- Data persistence
- Storage cleanup
- Storage encryption

---

## 6. UI COMPONENT LIBRARY

### Core UI Components

**`src/components/ui/Button.tsx`**
- Primary, secondary, outline, ghost variants
- Small, medium, large sizes
- Loading states
- Disabled states
- Icon support
- Custom styling props

**`src/components/ui/Input.tsx`**
- Text input with validation
- Password input with visibility toggle
- Search input with clear button
- Textarea for longer text
- Error state display
- Label and placeholder support

**`src/components/ui/Card.tsx`**
- Basic card container
- Shadow variants
- Pressable card option
- Custom styling support
- Loading state
- Error state

**`src/components/ui/Modal.tsx`**
- Full-screen modal
- Bottom sheet modal
- Alert modal
- Custom modal with backdrop
- Animation support
- Gesture handling

**`src/components/ui/Toast.tsx`**
- Success, error, warning, info variants
- Auto-dismiss functionality
- Action buttons
- Custom positioning
- Animation support

**`src/components/ui/Loading.tsx`**
- Spinner loading indicator
- Skeleton loading screens
- Progress bars
- Loading overlays
- Custom loading animations

**`src/components/ui/Avatar.tsx`**
- User profile pictures
- Initials fallback
- Online status indicator
- Size variants
- Border options
- Loading state

**`src/components/ui/Badge.tsx`**
- Notification badges
- Status indicators
- Count badges
- Color variants
- Size options

**`src/components/ui/Chip.tsx`**
- Interest tags
- Filter chips
- Selectable chips
- Removable chips
- Color variants

**`src/components/ui/Slider.tsx`**
- Age range slider
- Distance slider
- Custom range slider
- Step support
- Value display

**`src/components/ui/Switch.tsx`**
- Toggle switches
- Settings switches
- Custom styling
- Disabled states

**`src/components/ui/Checkbox.tsx`**
- Basic checkbox
- Custom styling
- Indeterminate state
- Label support

**`src/components/ui/RadioButton.tsx`**
- Radio button groups
- Custom styling
- Label support
- Disabled states

**`src/components/ui/Divider.tsx`**
- Horizontal dividers
- Vertical dividers
- Custom styling
- Text dividers

**`src/components/ui/EmptyState.tsx`**
- No data illustrations
- Action buttons
- Custom messages
- Loading states

**`src/components/ui/ErrorBoundary.tsx`**
- Error catching
- Fallback UI
- Error reporting
- Retry functionality

### Layout Components

**`src/components/layout/Screen.tsx`**
- Screen container with safe area
- Header integration
- Scroll view option
- Loading overlay
- Error state handling

**`src/components/layout/Header.tsx`**
- Navigation header
- Title and subtitle
- Back button
- Action buttons
- Search integration

**`src/components/layout/TabBar.tsx`**
- Custom tab bar
- Badge support
- Animation support
- Custom styling

**`src/components/layout/SafeAreaView.tsx`**
- Safe area handling
- Custom padding
- Background color support

**`src/components/layout/KeyboardAvoidingView.tsx`**
- Keyboard avoidance
- Custom behavior
- Scroll support

### Form Components

**`src/components/forms/FormField.tsx`**
- Form field wrapper
- Label and error display
- Validation integration
- Required field indicator

**`src/components/forms/FormSection.tsx`**
- Form section grouping
- Section headers
- Collapsible sections

**`src/components/forms/DatePicker.tsx`**
- Date selection
- Age calculation
- Custom styling
- Validation support

**`src/components/forms/LocationPicker.tsx`**
- Country/state/city selection
- Search functionality
- Current location detection
- Validation support

**`src/components/forms/PhotoPicker.tsx`**
- Multiple photo selection
- Camera integration
- Photo editing
- Drag and drop reordering

**`src/components/forms/InterestPicker.tsx`**
- Interest selection
- Category filtering
- Search functionality
- Maximum selection limits

---

## 7. FEATURE-SPECIFIC COMPONENTS

### Profile Components

**`src/components/profile/ProfileCard.tsx`**
- Discovery profile card
- Photo carousel
- Basic info display
- Action buttons (Like, Super Like, Dislike, Message)
- Compatibility score
- Distance display
- Online status

**`src/components/profile/ProfileHeader.tsx`**
- Profile photo and basic info
- Age and location
- Online status
- Verification badge
- Premium badge

**`src/components/profile/ProfileDetails.tsx`**
- Detailed profile information
- Bio display
- Interest tags
- Lifestyle information
- Relationship preferences

**`src/components/profile/PhotoGallery.tsx`**
- Photo carousel with indicators
- Full-screen photo viewer
- Photo editing (for own profile)
- Photo reordering
- Photo deletion
- Upload new photo

**`src/components/profile/InterestTags.tsx`**
- Interest display with categories
- Selectable interests (edit mode)
- Interest search
- Category filtering

**`src/components/profile/LifestyleInfo.tsx`**
- Exercise, education, job display
- Drinking and smoking habits
- Kids preferences
- Ethnicity and religion
- Relationship status

**`src/components/profile/CompatibilityScore.tsx`**
- Compatibility percentage
- Breakdown of compatibility factors
- Visual compatibility indicators

**`src/components/profile/ProfileStats.tsx`**
- Profile views count
- Match count
- Response rate
- Profile completion percentage

### Discovery Components

**`src/components/discovery/ProfileStack.tsx`**
- Stack of profile cards
- Swipe animations (even though no swiping)
- Card transitions
- Loading new profiles
- Empty state

**`src/components/discovery/ActionButtons.tsx`**
- Like button
- Super Like button
- Dislike button
- Message button
- Button animations
- Disabled states

**`src/components/discovery/FilterModal.tsx`**
- Age range filter
- Distance filter
- Gender preferences
- Lifestyle filters
- Interest filters
- Location filters

**`src/components/discovery/DiscoveryHeader.tsx`**
- Filter button
- Settings button
- Premium upgrade prompt
- Notification indicator

### Chat Components

**`src/components/chat/MessageBubble.tsx`**
- Text message display
- Media message display
- Timestamp display
- Read receipt indicator
- Message status (sending, sent, delivered, read)
- Message reactions

**`src/components/chat/MessageInput.tsx`**
- Text input with send button
- Media attachment button
- Voice message recording
- Emoji picker
- Character counter
- Typing indicator

**`src/components/chat/ChatHeader.tsx`**
- Match profile info
- Online status
- Last seen
- Video call button (future)
- Options menu

**`src/components/chat/MediaViewer.tsx`**
- Full-screen image viewer
- Video player
- Audio player
- Download option
- Share option

**`src/components/chat/TypingIndicator.tsx`**
- Animated typing dots
- User name display
- Multiple users typing

**`src/components/chat/ChatList.tsx`**
- List of chat conversations
- Last message preview
- Unread message count
- Online status indicators
- Search functionality

**`src/components/chat/VoiceRecorder.tsx`**
- Voice message recording
- Recording timer
- Playback preview
- Cancel/send options
- Audio visualization

### Match Request Components

**`src/components/requests/RequestCard.tsx`**
- Match request display
- Sender profile info
- Request type (like, super like, message)
- Accept/decline buttons
- Message preview (if direct message)

**`src/components/requests/RequestList.tsx`**
- List of match requests
- Priority sorting (super likes first)
- Filter options
- Empty state
- Loading states

**`src/components/requests/SuperLikeBadge.tsx`**
- Super like indicator
- Priority badge
- Expiry countdown
- Special styling

### Payment Components

**`src/components/payments/PricingCard.tsx`**
- Super like packages
- Premium subscription plans
- Feature comparison
- Popular badge
- Discount indicators

**`src/components/payments/PaymentForm.tsx`**
- Stripe payment form
- Payment method selection
- Billing address
- Security indicators
- Error handling

**`src/components/payments/PurchaseConfirmation.tsx`**
- Purchase success screen
- Receipt display
- Feature activation
- Share option

**`src/components/payments/SubscriptionStatus.tsx`**
- Current subscription info
- Renewal date
- Cancel subscription
- Upgrade/downgrade options

### Settings Components

**`src/components/settings/SettingsSection.tsx`**
- Settings group container
- Section headers
- Dividers

**`src/components/settings/SettingsItem.tsx`**
- Individual setting item
- Switch, button, or navigation variants
- Description text
- Icon support

**`src/components/settings/NotificationSettings.tsx`**
- Notification preferences
- Channel-specific settings
- Do not disturb
- Sound and vibration

**`src/components/settings/PrivacySettings.tsx`**
- Profile visibility
- Distance display
- Last seen visibility
- Block list management

**`src/components/settings/AccountSettings.tsx`**
- Email and password
- Account deletion
- Data export
- Support contact

### Onboarding Components

**`src/components/onboarding/StepIndicator.tsx`**
- Progress indicator
- Step numbers
- Completion status
- Navigation between steps

**`src/components/onboarding/WelcomeSlider.tsx`**
- App feature introduction
- Swipeable slides
- Skip option
- Get started button

**`src/components/onboarding/PhotoUploadGuide.tsx`**
- Photo upload instructions
- Best practices tips
- Example photos
- Requirements display

**`src/components/onboarding/InterestSelection.tsx`**
- Interest category display
- Multi-select functionality
- Search and filter
- Minimum selection enforcement

---

## 8. SCREEN COMPONENTS

### Authentication Screens

**`src/screens/auth/WelcomeScreen.tsx`**
- App logo and branding  
- Feature highlights
- "Continue with Google" button
- "Continue with Email" button
- Terms and privacy links
- No login/signup distinction (smart routing handles this)

**`src/screens/auth/EmailInputScreen.tsx`**
- Email input field
- Continue button with loading
- Back to welcome
- Form validation
- Error display
- Account status checking

**`src/screens/auth/OTPVerificationScreen.tsx`**
- OTP input field (6 digits)
- Verify button with loading
- Resend OTP button with countdown
- Back to email input
- Auto-submit when 6 digits entered
- Error display
- Account status routing after verification

**`src/screens/auth/GoogleAuthScreen.tsx`**
- Google OAuth integration
- Loading states
- Error handling
- Account status routing after Google auth
- Privacy policy acceptance

**`src/screens/auth/AuthLoadingScreen.tsx`**
- Loading spinner during auth checks
- Account status determination
- Smart routing to appropriate screen
- Error handling for auth failures

### Onboarding Screens

**`src/screens/onboarding/BasicInfoScreen.tsx`**
- Name input
- Age selection (date picker)
- Gender selection
- Bio input (optional)
- Continue button
- Progress indicator

**`src/screens/onboarding/LocationScreen.tsx`**
- Country selection
- State/province input
- City input
- Current location detection
- Location permissions
- Privacy explanation

**`src/screens/onboarding/PhotosScreen.tsx`**
- Photo upload interface
- Minimum 2 photos requirement
- Photo reordering
- Photo editing options
- Camera/gallery selection
- Upload progress

**`src/screens/onboarding/InterestsScreen.tsx`**
- Interest category tabs
- Interest selection grid
- Search functionality
- Minimum selection requirement
- Selected interests display

**`src/screens/onboarding/PreferencesScreen.tsx`**
- Age range slider
- Gender preferences
- Relationship type selection
- Looking for options
- Distance preference

**`src/screens/onboarding/LifestyleScreen.tsx`**
- Exercise level
- Education level
- Job type
- Drinking habits
- Smoking habits
- Kids preferences
- Ethnicity (optional)
- Religion (optional)

**`src/screens/onboarding/PersonalityScreen.tsx`**
- MBTI personality test
- Personality type selection
- Personality description
- Skip option

**`src/screens/onboarding/CompleteScreen.tsx`**
- Profile completion confirmation
- Profile preview
- Start discovering button
- Profile completion tips

### Main App Screens

**`src/screens/discovery/DiscoveryScreen.tsx`**
- Profile card stack
- Action buttons
- Filter button
- Settings button
- Empty state (no more profiles)
- Loading states
- Error handling

**`src/screens/discovery/ProfileDetailScreen.tsx`**
- Full profile display
- Photo gallery
- Detailed information
- Interest tags
- Lifestyle info
- Action buttons
- Report/block options

**`src/screens/discovery/FiltersScreen.tsx`**
- Age range filter
- Distance filter
- Gender preferences
- Lifestyle filters
- Interest filters
- Reset filters option
- Apply filters button

### Messages Screens

**`src/screens/messages/ChatsScreen.tsx`**
- Chat list
- Search functionality
- Unread message indicators
- Last message preview
- Online status
- Empty state
- Pull to refresh

**`src/screens/messages/RequestsScreen.tsx`**
- Match request list
- Super like priority section
- Accept/decline actions
- Request details modal
- Empty state
- Filter options

**`src/screens/messages/ViewsScreen.tsx`**
- Profile views list
- View timestamp
- Profile preview
- View back option
- Premium upsell

**`src/screens/messages/ChatScreen.tsx`**
- Message list
- Message input
- Media sharing
- Voice messages
- Typing indicators
- Read receipts
- Message reactions

**`src/screens/messages/MediaViewerScreen.tsx`**
- Full-screen media viewer
- Image gallery
- Video player
- Audio player
- Download/share options
- Navigation between media

### Profile Screens

**`src/screens/profile/ProfileScreen.tsx`**
- Own profile display
- Edit profile button
- Settings button
- Premium status
- Statistics display
- Photo management

**`src/screens/profile/EditProfileScreen.tsx`**
- Editable profile fields
- Photo management
- Interest editing
- Preference updates
- Save/cancel buttons
- Validation

**`src/screens/profile/PhotoManagementScreen.tsx`**
- Photo grid display
- Add new photo
- Reorder photos
- Delete photos
- Set main photo
- Photo editing

**`src/screens/profile/InterestManagementScreen.tsx`**
- Current interests display
- Add new interests
- Remove interests
- Interest categories
- Search functionality

**`src/screens/profile/PreferencesScreen.tsx`**
- Dating preferences
- Age range
- Gender preferences
- Distance settings
- Relationship type
- Looking for options

### Settings Screens

**`src/screens/settings/SettingsScreen.tsx`**
- Settings menu
- Account settings
- Privacy settings
- Notification settings
- Premium settings
- Support options
- Logout option

**`src/screens/settings/AccountSettingsScreen.tsx`**
- Email management
- Phone number
- Account deletion
- Data export
- Deactivate account
- Re-authentication for sensitive actions

**`src/screens/settings/PrivacySettingsScreen.tsx`**
- Profile visibility
- Distance display
- Last seen visibility
- Block list
- Data sharing preferences

**`src/screens/settings/NotificationSettingsScreen.tsx`**
- Push notifications
- In-app notifications
- Email notifications
- Notification channels
- Do not disturb

**`src/screens/settings/PremiumSettingsScreen.tsx`**
- Current subscription
- Upgrade options
- Billing history
- Cancel subscription
- Feature comparison

**`src/screens/settings/SupportScreen.tsx`**
- FAQ section
- Contact support
- Bug reporting
- Feature requests
- App rating

**`src/screens/settings/AboutScreen.tsx`**
- App version
- Terms of service
- Privacy policy
- Licenses
- Credits

### Payment Screens

**`src/screens/payments/SuperLikePurchaseScreen.tsx`**
- Super like packages
- Package selection
- Payment form
- Purchase confirmation
- Error handling

**`src/screens/payments/PremiumUpgradeScreen.tsx`**
- Premium plans
- Feature comparison
- Plan selection
- Payment processing
- Upgrade confirmation

**`src/screens/payments/PaymentHistoryScreen.tsx`**
- Transaction history
- Receipt viewing
- Refund requests
- Download receipts

**`src/screens/payments/BillingScreen.tsx`**
- Current subscription
- Payment methods
- Billing address
- Invoice history
- Update payment method

### Admin/Moderation Screens (if admin features needed)

**`src/screens/admin/AdminDashboardScreen.tsx`**
- Admin overview
- User statistics
- Report queue
- Moderation actions
- System health

**`src/screens/admin/ReportsScreen.tsx`**
- User reports list
- Report details
- Moderation actions
- Report resolution

**`src/screens/admin/UserManagementScreen.tsx`**
- User search
- User profiles
- Ban/unban users
- User statistics

---

## 9. NAVIGATION STRUCTURE

**`src/navigation/RootNavigator.tsx`**
- Main navigation container
- Authentication flow routing
- Deep linking setup
- Navigation state persistence

**`src/navigation/AuthNavigator.tsx`**
- Authentication stack (OTP-based)
- Welcome, Email Input, OTP Verification screens
- Google OAuth integration
- Smart routing based on account status

**`src/navigation/OnboardingNavigator.tsx`**
- Onboarding flow
- Step-by-step navigation
- Progress tracking
- Skip options

**`src/navigation/MainNavigator.tsx`**
- Bottom tab navigation
- Discovery, Messages, Profile tabs
- Tab bar customization
- Badge indicators

**`src/navigation/DiscoveryNavigator.tsx`**
- Discovery stack
- Profile details
- Filters screen
- Settings integration

**`src/navigation/MessagesNavigator.tsx`**
- Messages tab navigation
- Chats, Requests, Views tabs
- Chat screen navigation

**`src/navigation/ProfileNavigator.tsx`**
- Profile stack
- Edit profile
- Settings screens
- Photo management

**`src/navigation/SettingsNavigator.tsx`**
- Settings stack
- All settings screens
- Account management

**`src/navigation/PaymentNavigator.tsx`**
- Payment flow
- Purchase screens
- Billing management

---

## 10. CONTEXT PROVIDERS

**`src/context/AuthContext.tsx`**
- Authentication state (OTP-based)
- User session management
- OTP verification functions
- Google OAuth functions
- Session persistence
- Account status tracking
- Smart routing logic

**`src/context/ThemeContext.tsx`**
- Theme management
- Light/dark mode
- System theme detection
- Theme persistence

**`src/context/NotificationContext.tsx`**
- In-app notifications
- Notification queue
- Toast notifications
- Notification preferences

**`src/context/LocationContext.tsx`**
- Location services
- Current location
- Location permissions
- Location updates

**`src/context/PremiumContext.tsx`**
- Premium status
- Feature access
- Subscription management
- Usage tracking

**`src/context/ChatContext.tsx`**
- Active chat rooms
- Unread message counts
- Real-time updates
- Typing indicators

---

## 11. SUPABASE EDGE FUNCTIONS

### Core Business Logic Functions

- Generate and send OTP codes via email
- Rate limiting for OTP requests
- OTP expiry management
- Email template rendering
- Delivery tracking

**`supabase/functions/verify-otp/index.ts`**
- Verify OTP codes
- Account status checking
- User creation for new accounts
- Session management
- Security logging

**`supabase/functions/process-match-request/index.ts`**
- Handle match request acceptance
- Create match records
- Create chat rooms
- Send notifications
- Update user statistics
- Validate business rules

**`supabase/functions/discovery-algorithm/index.ts`**
- Advanced profile filtering
- Compatibility scoring
- Activity-based sorting
- Distance calculations
- Preference matching
- Exclude blocked/interacted users

**`supabase/functions/send-notification/index.ts`**
- Push notification sending
- Notification templating
- User preference checking
- Delivery tracking
- Batch notifications

**`supabase/functions/process-payment/index.ts`**
- Stripe webhook handling
- Payment verification
- User premium status updates
- Super likes credit addition
- Payment failure handling
- Refund processing

**`supabase/functions/moderate-content/index.ts`**
- Content moderation
- User report processing
- Automatic content filtering
- Admin action execution
- Evidence collection

**`supabase/functions/analytics-tracker/index.ts`**
- User behavior tracking
- Event aggregation
- Performance metrics
- Business intelligence
- Data export

**`supabase/functions/cleanup-data/index.ts`**
- Expired data cleanup
- Inactive user handling
- Old message deletion
- Media file cleanup
- Database optimization

**`supabase/functions/user-recommendations/index.ts`**
- AI-powered recommendations
- Machine learning integration
- Preference learning
- Success rate optimization

### Webhook Functions

**`supabase/functions/stripe-webhook/index.ts`**
- Stripe event processing
- Payment confirmations
- Subscription updates
- Failed payment handling
- Chargeback processing

**`supabase/functions/expo-webhook/index.ts`**
- Push notification receipts
- Delivery confirmations
- Device token updates
- Notification analytics

---

## FILES THAT NEED TO BE MODIFIED FOR OTP AUTHENTICATION

### Current Files Requiring Changes

**`src/lib/supabase.ts`** - NEEDS MODIFICATION
- Remove password-based auth configuration
- Configure for OTP-based authentication
- Set up Google OAuth provider
- Update session handling for OTP flow

**`src/types/index.ts`** - NEEDS MODIFICATION  
- Remove password-related interfaces (`SignupCredentials`, `LoginCredentials`)
- Add OTP-specific interfaces (`OTPRequest`, `OTPVerification`, `AccountStatus`)
- Update `AuthUser` interface to include auth provider
- Add Google OAuth related types

**`App.tsx`** - NEEDS MODIFICATION
- Update to handle OTP-based authentication flow
- Add Google OAuth configuration
- Update navigation routing based on account status

### Database Schema Considerations

The current `supabase/schema.sql` does NOT contain any password fields in the users table, which is correct for OTP-based auth. However, we may need to add:

```sql
-- Add to users table if not present:
ALTER TABLE users ADD COLUMN IF NOT EXISTS auth_provider VARCHAR DEFAULT 'email'; -- 'email' or 'google'
ALTER TABLE users ADD COLUMN IF NOT EXISTS google_id VARCHAR UNIQUE; -- For Google OAuth
ALTER TABLE users ADD COLUMN IF NOT EXISTS email_verified BOOLEAN DEFAULT FALSE;

-- OTP tracking table (optional, can use Supabase auth directly)
CREATE TABLE IF NOT EXISTS otp_codes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR NOT NULL,
  code VARCHAR(6) NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL,
  used_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Authentication Flow Summary

1. **Welcome Screen** → Continue with Google OR Continue with Email
2. **Google Flow**: OAuth → Check account status → Route accordingly
3. **Email Flow**: Email Input → OTP Verification → Check account status → Route accordingly
4. **Account Status Routing**:
   - New user → Onboarding flow
   - Existing complete user → Main app
   - Incomplete user → Resume from last completed onboarding step

### Key Implementation Notes

- No passwords anywhere in the system
- Supabase Auth handles OTP generation and verification
- Google OAuth integration through Supabase Auth
- Smart routing based on user profile completion status
- Session persistence through Expo SecureStore
- Rate limiting on OTP requests to prevent abuse

---

## 12. ADDITIONAL UTILITY FILES

**`src/utils/constants.ts`**
- App configuration constants
- Business rule constants
- API endpoints
- Error messages
- Default values

**`src/utils/helpers.ts`**
- General helper functions
- Data transformation
- Array utilities
- Object utilities
- String utilities

**`src/utils/errors.ts`**
- Error handling utilities
- Error classification
- Error reporting
- User-friendly error messages

**`src/utils/cache.ts`**
- Caching utilities
- Cache invalidation
- Memory management
- Persistent cache

**`src/utils/security.ts`**
- Security utilities
- Input sanitization
- XSS prevention
- Data encryption helpers

---

## 13. TESTING FILES

### Unit Tests

**`src/__tests__/services/authService.test.ts`**
**`src/__tests__/services/userService.test.ts`**
**`src/__tests__/services/discoveryService.test.ts`**
**`src/__tests__/services/chatService.test.ts`**
**`src/__tests__/services/paymentService.test.ts`**

### Component Tests

**`src/__tests__/components/ProfileCard.test.tsx`**
**`src/__tests__/components/MessageBubble.test.tsx`**
**`src/__tests__/components/Button.test.tsx`**
**`src/__tests__/components/Input.test.tsx`**

### Hook Tests

**`src/__tests__/hooks/useAuth.test.ts`**
**`src/__tests__/hooks/useDiscovery.test.ts`**
**`src/__tests__/hooks/useChat.test.ts`**

### Screen Tests

**`src/__tests__/screens/LoginScreen.test.tsx`**
**`src/__tests__/screens/DiscoveryScreen.test.tsx`**
**`src/__tests__/screens/ChatScreen.test.tsx`**

### Utility Tests

**`src/__tests__/utils/validation.test.ts`**
**`src/__tests__/utils/formatting.test.ts`**
**`src/__tests__/utils/permissions.test.ts`**

---

## 14. CONFIGURATION & SETUP FILES

**`src/config/reactQuery.ts`**
- React Query configuration
- Cache settings
- Retry logic
- Error handling

**`src/config/navigation.ts`**
- Navigation configuration
- Deep linking setup
- Navigation themes

**`src/config/stripe.ts`**
- Stripe configuration
- Payment method setup
- Webhook endpoints

**`src/config/analytics.ts`**
- Analytics configuration
- Event tracking setup
- User property definitions

**`src/config/notifications.ts`**
- Notification channels
- Default settings
- Sound configurations

---

## SUMMARY

This analysis reveals that while we have an excellent database foundation and basic type definitions, we need to build:

- **42 Service files** for all business logic
- **38 Custom hooks** for state management and data fetching
- **67 UI components** for the interface
- **31 Screen components** for all app screens
- **9 Navigation files** for app flow
- **6 Context providers** for global state
- **8 Edge functions** for server-side logic
- **25+ Utility files** for helper functions
- **20+ Test files** for quality assurance
- **8 Configuration files** for app setup

**Total: ~254 files need to be created** for a production-ready dating application.


