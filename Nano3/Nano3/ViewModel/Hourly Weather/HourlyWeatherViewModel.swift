import Foundation
import WeatherKit
import CoreLocation

class HourlyWeatherViewModel: ObservableObject {
   @Published var isLoading = true
   
   @Published var selectedDate: Date? {
      didSet {
         if let location = LocationViewModel.shared.currentUserLocation, let date = selectedDate {
            Task {
               await getHourlyForecast(location: location, date: date)
            }
         }
      }
   }
   
   @Published var hourlyForecast: [HourlyWeather]? {
      didSet {
         if let hourlyForecast = hourlyForecast {
            CurrentWeatherViewModel.shared.findBestTimeFrame(for: hourlyForecast)
         }
      }
   }
   
   static let shared = HourlyWeatherViewModel()
   
   private var weatherServiceManager: HourlyWeatherDelegate
   
   init() {
      weatherServiceManager = WeatherServiceManager()
      DispatchQueue.main.async {
         self.selectedDate = Date.now
         self.isLoading = true
      }
   }
   
   func getHourlyForecast(location: CLLocation, date: Date) async {
      let forecast: [HourlyWeather]?
      if Date.isToday(inputDate: date) {
         var components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: date)
         components.hour = Calendar.current.component(.hour, from: Date.now)
         let date = Calendar.current.date(from: components)
         forecast = await weatherServiceManager.getHourlyWeather(location: location, date: date!)
      } else {
         var components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: date)
         components.hour = 6
         let date = Calendar.current.date(from: components)
         forecast = await weatherServiceManager.getHourlyWeather(location: location, date: date!)
      }
      DispatchQueue.main.async {
         self.hourlyForecast = forecast
         self.isLoading = false
      }
   }
}

