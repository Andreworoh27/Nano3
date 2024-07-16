import SwiftUI

struct CurrentWeatherView: View {
   @EnvironmentObject var viewModel: CurrentWeatherViewModel
   
   var body: some View {
      ZStack {
         VStack(alignment: .leading) {
            VStack(alignment: .leading) {
               Text(viewModel.title)
                  .fontWeight(.semibold)
                  .font(.system(size: 20))
               
               HStack {
                  Image(systemName: "figure.walk")
                     .imageScale(.large)
                     .font(.title)
                  Text(viewModel.timeRange)
                     .font(.system(size: 40))
                     .fontWeight(.bold)
               }
               .padding(.vertical, 2)
               Text(viewModel.description)
                  .font(.system(size: 14))
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
   }
}
