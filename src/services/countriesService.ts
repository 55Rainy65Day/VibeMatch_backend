import { supabase } from '../lib/supabase';
import { Country, Continent, POPULAR_COUNTRIES } from '../types';

export class CountriesService {
  /**
   * Get all countries
   */
  static async getAllCountries(): Promise<Country[]> {
    const { data, error } = await supabase
      .from('countries')
      .select('*')
      .order('name');

    if (error) {
      throw new Error(`Failed to fetch countries: ${error.message}`);
    }

    return data || [];
  }

  /**
   * Get countries by continent
   */
  static async getCountriesByContinent(continent: Continent): Promise<Country[]> {
    const { data, error } = await supabase
      .from('countries')
      .select('*')
      .eq('continent', continent)
      .order('name');

    if (error) {
      throw new Error(`Failed to fetch countries for ${continent}: ${error.message}`);
    }

    return data || [];
  }

  /**
   * Get popular countries for quick selection
   */
  static async getPopularCountries(): Promise<Country[]> {
    const { data, error } = await supabase
      .from('countries')
      .select('*')
      .in('code', POPULAR_COUNTRIES)
      .order('name');

    if (error) {
      throw new Error(`Failed to fetch popular countries: ${error.message}`);
    }

    return data || [];
  }

  /**
   * Search countries by name
   */
  static async searchCountries(query: string): Promise<Country[]> {
    const { data, error } = await supabase
      .from('countries')
      .select('*')
      .ilike('name', `%${query}%`)
      .order('name')
      .limit(20);

    if (error) {
      throw new Error(`Failed to search countries: ${error.message}`);
    }

    return data || [];
  }

  /**
   * Get country by code (ISO 3166-1 alpha-2)
   */
  static async getCountryByCode(code: string): Promise<Country | null> {
    const { data, error } = await supabase
      .from('countries')
      .select('*')
      .eq('code', code.toUpperCase())
      .single();

    if (error) {
      if (error.code === 'PGRST116') {
        return null; // No rows returned
      }
      throw new Error(`Failed to fetch country by code: ${error.message}`);
    }

    return data;
  }

  /**
   * Get country by ID
   */
  static async getCountryById(id: string): Promise<Country | null> {
    const { data, error } = await supabase
      .from('countries')
      .select('*')
      .eq('id', id)
      .single();

    if (error) {
      if (error.code === 'PGRST116') {
        return null; // No rows returned
      }
      throw new Error(`Failed to fetch country by ID: ${error.message}`);
    }

    return data;
  }

  /**
   * Get countries grouped by continent
   */
  static async getCountriesGroupedByContinent(): Promise<Record<Continent, Country[]>> {
    const countries = await this.getAllCountries();
    
    const grouped: Record<Continent, Country[]> = {
      'Africa': [],
      'Antarctica': [],
      'Asia': [],
      'Europe': [],
      'North America': [],
      'Oceania': [],
      'South America': []
    };

    countries.forEach(country => {
      grouped[country.continent].push(country);
    });

    return grouped;
  }

  /**
   * Get flag emoji for country code
   */
  static getFlagEmoji(countryCode: string): string {
    if (!countryCode || countryCode.length !== 2) {
      return '🏳️'; // Default flag
    }

    const codePoints = countryCode
      .toUpperCase()
      .split('')
      .map(char => 127397 + char.charCodeAt(0));
    
    return String.fromCodePoint(...codePoints);
  }

  /**
   * Detect user's country from their location (requires location permission)
   * This is a placeholder - you would integrate with a geolocation service
   */
  static async detectUserCountry(): Promise<Country | null> {
    try {
      // This would typically use the device's location or IP-based detection
      // For now, we'll return null and let the user select manually
      
      // Example implementation with IP geolocation service:
      // const response = await fetch('https://ipapi.co/json/');
      // const data = await response.json();
      // return await this.getCountryByCode(data.country_code);
      
      return null;
    } catch (error) {
      console.warn('Failed to detect user country:', error);
      return null;
    }
  }

  /**
   * Format country display name with flag
   */
  static formatCountryDisplay(country: Country): string {
    const flag = this.getFlagEmoji(country.code);
    return `${flag} ${country.name}`;
  }

  /**
   * Get continent display name with emoji
   */
  static getContinentDisplay(continent: Continent): string {
    const continentEmojis: Record<Continent, string> = {
      'Africa': '🌍',
      'Antarctica': '🐧',
      'Asia': '🌏',
      'Europe': '🌍',
      'North America': '🌎',
      'Oceania': '🌏',
      'South America': '🌎'
    };

    return `${continentEmojis[continent]} ${continent}`;
  }
}

// Export utility functions for easy access
export const {
  getAllCountries,
  getCountriesByContinent,
  getPopularCountries,
  searchCountries,
  getCountryByCode,
  getCountryById,
  getCountriesGroupedByContinent,
  getFlagEmoji,
  detectUserCountry,
  formatCountryDisplay,
  getContinentDisplay
} = CountriesService;