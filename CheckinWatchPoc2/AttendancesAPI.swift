import Foundation

struct AttendancesAPI {
    
    func getAttendances() -> [Attendance] {
        return [getAttendance()]
    }
    
    func getAttendance() -> Attendance {
        let product = AttendanceProduct(id: "1", name: "Swimming")
        let partner = AttendancePartner(name: "Premium Parnter", id: "1", product: product, logo: "https://www.benessegestaoesportiva.com.br/images/condominios/golfe-fitness.jpg")
        return Attendance(partner: partner, date: "Apr 17, 2020  •  3:45 pm", validation: AttendanceValidationType(type: "QRCODE", info: "https://www.figma.com/file/2sYk1gnajUNgDd3j6OTV2o/Catalina---Starting-project?node-id=1602%3A14147"))
    }
    
}
