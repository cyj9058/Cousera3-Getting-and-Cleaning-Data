import os 
os.chdir("/Users/joyeongji/Dropbox/data")

import openpyxl as xl
import numpy as np
risk=xl.load_workbook("power-plant-risk-analysis.xlsx",read_only=True)


risk.sheetnames()
risk.sheet=risk.get_sheet_by_name("시트2")

risk.sheet.iter_rows()
use_col = 0  # column index from each row to get value of
x2 = np.array([r[use_col].value for r in riks.sheet.iter_rows()]
 
