import SwiftUI

struct CurrentWeatherView: View {
   @EnvironmentObject var viewModel: CurrentWeatherViewModel
   
   var body: some View {
      ZStack {
         AmbianceBackgroundView(colors: [
            [.yellow500, .green500],
            [.blue500, .green500],
            [.yellow500, .green500],
            [.blue500, .green500],
            [.blue500, .green500],
            [.yellow500, .green500],
         ])
         .ignoresSafeArea()
         .frame(height: 35)
         
         VStack(alignment: .leading) {
            VStack(alignment: .leading) {
               Text(LocalizedStringKey(viewModel.title))
                  .fontWeight(.semibold)
                  .font(.system(size: 20))
               
               if !viewModel.timeRange.isEmpty{
                  HStack {
                     Image(systemName: "figure.walk")
                        .imageScale(.large)
                        .font(.title)
                     Text(viewModel.timeRange)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                  }
                  .padding(.vertical, 2)
               }
               Text(LocalizedStringKey(viewModel.description))
                  .font(.system(size: 14))
                  .padding(.top, 8)
                  .fontWeight(.semibold)
            }
         }
         .frame(maxWidth: .infinity, alignment: .leading)
         .foregroundStyle(.white)
         .padding()
         .background(.ultraThinMaterial.opacity(0.1))
      }
   }
}

struct CurrentWeatherView_Previews: PreviewProvider {
   static var previews: some View {
      CurrentWeatherView()
         .background(Color.blue)
         .environmentObject(CurrentWeatherViewModel.shared)
   }
}
