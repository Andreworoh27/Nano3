import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var viewModel: CurrentWeatherViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .fontWeight(.semibold)
                        .font(.title3)

                    Text(viewModel.date)
                        .padding(.bottom)

                    HStack {
                        Image(systemName: "figure.walk")
                            .imageScale(.large)
                        Text(viewModel.timeRange)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    Text(viewModel.description)
                        .font(.caption)
                }
                .frame(width: 275)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(
            viewModel: CurrentWeatherViewModel(
                title: "Best times to play outdoors",
                date: "Today on July 10th",
                timeRange: "06:00 - 11:00",
                description: "Enjoy outdoor playtime with your kids during these safe UV hours, with gentler sun and less risk of sunburn!",
                hourlyWeatherArray: [
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 6, minute: 0, second: 0, of: Date())!, condition: .clear, uvi: 5, uviDesc: "Moderate", symbol: "sun.max"),
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!, condition: .mostlyClear, uvi: 3, uviDesc: "Low", symbol: "sun.max"),
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, condition: .breezy, uvi: 6, uviDesc: "Moderate", symbol: "wind"),
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!, condition: .windy, uvi: 2, uviDesc: "Low", symbol: "wind"),
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!, condition: .partlyCloudy, uvi: 4, uviDesc: "Moderate", symbol: "cloud.sun"),
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 11, minute: 0, second: 0, of: Date())!, condition: .cloudy, uvi: 8, uviDesc: "High", symbol: "cloud"),
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date())!, condition: .blizzard, uvi: 0, uviDesc: "None", symbol: "cloud.rain"),
                    HourlyWeather(hour: Calendar.current.date(bySettingHour: 13, minute: 0, second: 0, of: Date())!, condition: .blizzard, uvi: 0, uviDesc: "None", symbol: "snow")]
                
            )
        )
        .background(Color.blue)
    }
}
