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
                description: "Enjoy outdoor playtime with your kids during these safe UV hours, with gentler sun and less risk of sunburn!"
            )
        )
        .background(Color.blue)
    }
}
