import { supabase } from '../lib/supabase';
import {
  Gender,
  PersonalityType,
  InterestCategoryData,
  InterestData,
  ExerciseLevel,
  EducationLevel,
  JobType,
  DrinkingHabit,
  SmokingHabit,
  KidsPreference,
  Ethnicity,
  Religion,
  RelationshipType,
  RelationshipStatus,
  Sexuality,
  LookingForOption,
} from '../types';

export class ReferenceDataService {
  // Gender options
  static async getGenders(): Promise<Gender[]> {
    const { data, error } = await supabase
      .from('genders')
      .select('*')
      .order('code');

    if (error) {
      throw new Error(`Failed to fetch genders: ${error.message}`);
    }

    return data || [];
  }

  // Personality types
  static async getPersonalityTypes(): Promise<PersonalityType[]> {
    const { data, error } = await supabase
      .from('personality_types')
      .select('*')
      .order('code');

    if (error) {
      throw new Error(`Failed to fetch personality types: ${error.message}`);
    }

    return data || [];
  }

  static async getPersonalityTypesByCategory(category: string): Promise<PersonalityType[]> {
    const { data, error } = await supabase
      .from('personality_types')
      .select('*')
      .eq('category', category)
      .order('code');

    if (error) {
      throw new Error(`Failed to fetch personality types for ${category}: ${error.message}`);
    }

    return data || [];
  }

  // Interest categories and interests
  static async getInterestCategories(): Promise<InterestCategoryData[]> {
    const { data, error } = await supabase
      .from('interest_categories')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch interest categories: ${error.message}`);
    }

    return data || [];
  }

  static async getInterests(): Promise<InterestData[]> {
    const { data, error } = await supabase
      .from('interests')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch interests: ${error.message}`);
    }

    return data || [];
  }

  static async getInterestsByCategory(categoryId: string): Promise<InterestData[]> {
    const { data, error } = await supabase
      .from('interests')
      .select('*')
      .eq('category_id', categoryId)
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch interests for category: ${error.message}`);
    }

    return data || [];
  }

  static async getInterestsGroupedByCategory(): Promise<Record<string, InterestData[]>> {
    const { data, error } = await supabase
      .from('interests')
      .select(`
        *,
        interest_categories!inner(id, name)
      `)
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch grouped interests: ${error.message}`);
    }

    const grouped: Record<string, InterestData[]> = {};
    
    data?.forEach((interest: any) => {
      const categoryName = interest.interest_categories.name;
      if (!grouped[categoryName]) {
        grouped[categoryName] = [];
      }
      grouped[categoryName].push(interest);
    });

    return grouped;
  }

  // Lifestyle options
  static async getExerciseLevels(): Promise<ExerciseLevel[]> {
    const { data, error } = await supabase
      .from('exercise_levels')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch exercise levels: ${error.message}`);
    }

    return data || [];
  }

  static async getEducationLevels(): Promise<EducationLevel[]> {
    const { data, error } = await supabase
      .from('education_levels')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch education levels: ${error.message}`);
    }

    return data || [];
  }

  static async getJobTypes(): Promise<JobType[]> {
    const { data, error } = await supabase
      .from('job_types')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch job types: ${error.message}`);
    }

    return data || [];
  }

  static async getDrinkingHabits(): Promise<DrinkingHabit[]> {
    const { data, error } = await supabase
      .from('drinking_habits')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch drinking habits: ${error.message}`);
    }

    return data || [];
  }

  static async getSmokingHabits(): Promise<SmokingHabit[]> {
    const { data, error } = await supabase
      .from('smoking_habits')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch smoking habits: ${error.message}`);
    }

    return data || [];
  }

  static async getKidsPreferences(): Promise<KidsPreference[]> {
    const { data, error } = await supabase
      .from('kids_preferences')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch kids preferences: ${error.message}`);
    }

    return data || [];
  }

  static async getEthnicities(): Promise<Ethnicity[]> {
    const { data, error } = await supabase
      .from('ethnicities')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch ethnicities: ${error.message}`);
    }

    return data || [];
  }

  static async getReligions(): Promise<Religion[]> {
    const { data, error } = await supabase
      .from('religions')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch religions: ${error.message}`);
    }

    return data || [];
  }

  // Relationship preferences
  static async getRelationshipTypes(): Promise<RelationshipType[]> {
    const { data, error } = await supabase
      .from('relationship_types')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch relationship types: ${error.message}`);
    }

    return data || [];
  }

  static async getRelationshipStatuses(): Promise<RelationshipStatus[]> {
    const { data, error } = await supabase
      .from('relationship_statuses')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch relationship statuses: ${error.message}`);
    }

    return data || [];
  }

  static async getSexualities(): Promise<Sexuality[]> {
    const { data, error } = await supabase
      .from('sexualities')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch sexualities: ${error.message}`);
    }

    return data || [];
  }

  static async getLookingForOptions(): Promise<LookingForOption[]> {
    const { data, error } = await supabase
      .from('looking_for_options')
      .select('*')
      .order('sort_order');

    if (error) {
      throw new Error(`Failed to fetch looking for options: ${error.message}`);
    }

    return data || [];
  }

  // Utility methods for finding by code or ID
  static async findGenderByCode(code: string): Promise<Gender | null> {
    const { data, error } = await supabase
      .from('genders')
      .select('*')
      .eq('code', code)
      .single();

    if (error) {
      if (error.code === 'PGRST116') return null;
      throw new Error(`Failed to find gender by code: ${error.message}`);
    }

    return data;
  }

  static async findPersonalityTypeByCode(code: string): Promise<PersonalityType | null> {
    const { data, error } = await supabase
      .from('personality_types')
      .select('*')
      .eq('code', code)
      .single();

    if (error) {
      if (error.code === 'PGRST116') return null;
      throw new Error(`Failed to find personality type by code: ${error.message}`);
    }

    return data;
  }

  static async findInterestByName(name: string): Promise<InterestData | null> {
    const { data, error } = await supabase
      .from('interests')
      .select('*')
      .eq('name', name)
      .single();

    if (error) {
      if (error.code === 'PGRST116') return null;
      throw new Error(`Failed to find interest by name: ${error.message}`);
    }

    return data;
  }

  // Bulk fetch all reference data for initialization
  static async getAllReferenceData() {
    try {
      const [
        genders,
        personalityTypes,
        interestCategories,
        interests,
        exerciseLevels,
        educationLevels,
        jobTypes,
        drinkingHabits,
        smokingHabits,
        kidsPreferences,
        ethnicities,
        religions,
        relationshipTypes,
        relationshipStatuses,
        sexualities,
        lookingForOptions,
      ] = await Promise.all([
        this.getGenders(),
        this.getPersonalityTypes(),
        this.getInterestCategories(),
        this.getInterests(),
        this.getExerciseLevels(),
        this.getEducationLevels(),
        this.getJobTypes(),
        this.getDrinkingHabits(),
        this.getSmokingHabits(),
        this.getKidsPreferences(),
        this.getEthnicities(),
        this.getReligions(),
        this.getRelationshipTypes(),
        this.getRelationshipStatuses(),
        this.getSexualities(),
        this.getLookingForOptions(),
      ]);

      return {
        genders,
        personalityTypes,
        interestCategories,
        interests,
        exerciseLevels,
        educationLevels,
        jobTypes,
        drinkingHabits,
        smokingHabits,
        kidsPreferences,
        ethnicities,
        religions,
        relationshipTypes,
        relationshipStatuses,
        sexualities,
        lookingForOptions,
      };
    } catch (error) {
      throw new Error(`Failed to fetch reference data: ${error}`);
    }
  }

  // Search functionality
  static async searchInterests(query: string): Promise<InterestData[]> {
    const { data, error } = await supabase
      .from('interests')
      .select('*')
      .ilike('name', `%${query}%`)
      .order('sort_order')
      .limit(20);

    if (error) {
      throw new Error(`Failed to search interests: ${error.message}`);
    }

    return data || [];
  }
}

// Export utility functions for easy access
export const {
  getGenders,
  getPersonalityTypes,
  getPersonalityTypesByCategory,
  getInterestCategories,
  getInterests,
  getInterestsByCategory,
  getInterestsGroupedByCategory,
  getExerciseLevels,
  getEducationLevels,
  getJobTypes,
  getDrinkingHabits,
  getSmokingHabits,
  getKidsPreferences,
  getEthnicities,
  getReligions,
  getRelationshipTypes,
  getRelationshipStatuses,
  getSexualities,
  getLookingForOptions,
  findGenderByCode,
  findPersonalityTypeByCode,
  findInterestByName,
  getAllReferenceData,
  searchInterests,
} = ReferenceDataService;