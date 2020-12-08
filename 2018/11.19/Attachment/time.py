import xlrd
import xlwt
ExcelFile=xlrd.open_workbook(r'C:\Users\tianzhy\Desktop\COMAP_RollerCoasterData_2018 - Copy.xlsx')
sheet=ExcelFile.sheet_by_name('RollerCoasterData')
workbook = xlwt.Workbook(encoding = 'ascii')
worksheet = workbook.add_sheet('My Worksheet')
for i in range (1,219):
    temp = sheet.cell(i,17).value
    #temp = str.split(temp,":")
    timee=round(float(temp)*1440)
    worksheet.write(i, 0, label = str(timee))
workbook.save('Excel_Workbook.xls')
