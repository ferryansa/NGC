from fastapi import FastAPI, HTTPException
import pandas as pd

api_lc3 = FastAPI()

df = pd.read_csv("data_after_outlier_handling.csv")

df_dict = df.to_dict(orient="records")

@api_lc3.get("/data")
def get_data():
    return df_dict

@api_lc3.delete("/delete/{index}")
def delete(index:int):
    global df_dict

    if index >= len(df_dict) or index  < 0:
        raise HTTPException(status_code=404, detail=f"Durasi pada index {index} tidak ditemukan")
    else:
        del df_dict[index]
        return {"message":f"Durasi pada index {index} berhasil di hapus"}