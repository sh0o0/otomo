// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.23.4
// source: message_send_count.proto

package grpcgen

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type MessageSentCount struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MonthlySurplus *MonthlySurplusMessageSentCount `protobuf:"bytes,1,opt,name=monthly_surplus,json=monthlySurplus,proto3" json:"monthly_surplus,omitempty"`
	Daily          *DailyMessageSentCount          `protobuf:"bytes,2,opt,name=daily,proto3" json:"daily,omitempty"`
}

func (x *MessageSentCount) Reset() {
	*x = MessageSentCount{}
	if protoimpl.UnsafeEnabled {
		mi := &file_message_send_count_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *MessageSentCount) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*MessageSentCount) ProtoMessage() {}

func (x *MessageSentCount) ProtoReflect() protoreflect.Message {
	mi := &file_message_send_count_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use MessageSentCount.ProtoReflect.Descriptor instead.
func (*MessageSentCount) Descriptor() ([]byte, []int) {
	return file_message_send_count_proto_rawDescGZIP(), []int{0}
}

func (x *MessageSentCount) GetMonthlySurplus() *MonthlySurplusMessageSentCount {
	if x != nil {
		return x.MonthlySurplus
	}
	return nil
}

func (x *MessageSentCount) GetDaily() *DailyMessageSentCount {
	if x != nil {
		return x.Daily
	}
	return nil
}

type MonthlySurplusMessageSentCount struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	YearMonth *YearMonth `protobuf:"bytes,1,opt,name=year_month,json=yearMonth,proto3" json:"year_month,omitempty"`
	Count     int32      `protobuf:"varint,2,opt,name=count,proto3" json:"count,omitempty"`
}

func (x *MonthlySurplusMessageSentCount) Reset() {
	*x = MonthlySurplusMessageSentCount{}
	if protoimpl.UnsafeEnabled {
		mi := &file_message_send_count_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *MonthlySurplusMessageSentCount) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*MonthlySurplusMessageSentCount) ProtoMessage() {}

func (x *MonthlySurplusMessageSentCount) ProtoReflect() protoreflect.Message {
	mi := &file_message_send_count_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use MonthlySurplusMessageSentCount.ProtoReflect.Descriptor instead.
func (*MonthlySurplusMessageSentCount) Descriptor() ([]byte, []int) {
	return file_message_send_count_proto_rawDescGZIP(), []int{1}
}

func (x *MonthlySurplusMessageSentCount) GetYearMonth() *YearMonth {
	if x != nil {
		return x.YearMonth
	}
	return nil
}

func (x *MonthlySurplusMessageSentCount) GetCount() int32 {
	if x != nil {
		return x.Count
	}
	return 0
}

type DailyMessageSentCount struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Date  *Date `protobuf:"bytes,1,opt,name=date,proto3" json:"date,omitempty"`
	Count int32 `protobuf:"varint,2,opt,name=count,proto3" json:"count,omitempty"`
}

func (x *DailyMessageSentCount) Reset() {
	*x = DailyMessageSentCount{}
	if protoimpl.UnsafeEnabled {
		mi := &file_message_send_count_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DailyMessageSentCount) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DailyMessageSentCount) ProtoMessage() {}

func (x *DailyMessageSentCount) ProtoReflect() protoreflect.Message {
	mi := &file_message_send_count_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DailyMessageSentCount.ProtoReflect.Descriptor instead.
func (*DailyMessageSentCount) Descriptor() ([]byte, []int) {
	return file_message_send_count_proto_rawDescGZIP(), []int{2}
}

func (x *DailyMessageSentCount) GetDate() *Date {
	if x != nil {
		return x.Date
	}
	return nil
}

func (x *DailyMessageSentCount) GetCount() int32 {
	if x != nil {
		return x.Count
	}
	return 0
}

type RemainingMessageSendCount struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MonthlySurplus *RemainingMonthlySurplusMessageSendCount `protobuf:"bytes,1,opt,name=monthly_surplus,json=monthlySurplus,proto3" json:"monthly_surplus,omitempty"`
	Daily          *RemainingDailyMessageSendCount          `protobuf:"bytes,2,opt,name=daily,proto3" json:"daily,omitempty"`
}

func (x *RemainingMessageSendCount) Reset() {
	*x = RemainingMessageSendCount{}
	if protoimpl.UnsafeEnabled {
		mi := &file_message_send_count_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RemainingMessageSendCount) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RemainingMessageSendCount) ProtoMessage() {}

func (x *RemainingMessageSendCount) ProtoReflect() protoreflect.Message {
	mi := &file_message_send_count_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RemainingMessageSendCount.ProtoReflect.Descriptor instead.
func (*RemainingMessageSendCount) Descriptor() ([]byte, []int) {
	return file_message_send_count_proto_rawDescGZIP(), []int{3}
}

func (x *RemainingMessageSendCount) GetMonthlySurplus() *RemainingMonthlySurplusMessageSendCount {
	if x != nil {
		return x.MonthlySurplus
	}
	return nil
}

func (x *RemainingMessageSendCount) GetDaily() *RemainingDailyMessageSendCount {
	if x != nil {
		return x.Daily
	}
	return nil
}

type RemainingMonthlySurplusMessageSendCount struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	YearMonth *YearMonth `protobuf:"bytes,1,opt,name=year_month,json=yearMonth,proto3" json:"year_month,omitempty"`
	Count     int32      `protobuf:"varint,2,opt,name=count,proto3" json:"count,omitempty"`
}

func (x *RemainingMonthlySurplusMessageSendCount) Reset() {
	*x = RemainingMonthlySurplusMessageSendCount{}
	if protoimpl.UnsafeEnabled {
		mi := &file_message_send_count_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RemainingMonthlySurplusMessageSendCount) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RemainingMonthlySurplusMessageSendCount) ProtoMessage() {}

func (x *RemainingMonthlySurplusMessageSendCount) ProtoReflect() protoreflect.Message {
	mi := &file_message_send_count_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RemainingMonthlySurplusMessageSendCount.ProtoReflect.Descriptor instead.
func (*RemainingMonthlySurplusMessageSendCount) Descriptor() ([]byte, []int) {
	return file_message_send_count_proto_rawDescGZIP(), []int{4}
}

func (x *RemainingMonthlySurplusMessageSendCount) GetYearMonth() *YearMonth {
	if x != nil {
		return x.YearMonth
	}
	return nil
}

func (x *RemainingMonthlySurplusMessageSendCount) GetCount() int32 {
	if x != nil {
		return x.Count
	}
	return 0
}

type RemainingDailyMessageSendCount struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Date  *Date `protobuf:"bytes,1,opt,name=date,proto3" json:"date,omitempty"`
	Count int32 `protobuf:"varint,2,opt,name=count,proto3" json:"count,omitempty"`
}

func (x *RemainingDailyMessageSendCount) Reset() {
	*x = RemainingDailyMessageSendCount{}
	if protoimpl.UnsafeEnabled {
		mi := &file_message_send_count_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RemainingDailyMessageSendCount) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RemainingDailyMessageSendCount) ProtoMessage() {}

func (x *RemainingDailyMessageSendCount) ProtoReflect() protoreflect.Message {
	mi := &file_message_send_count_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RemainingDailyMessageSendCount.ProtoReflect.Descriptor instead.
func (*RemainingDailyMessageSendCount) Descriptor() ([]byte, []int) {
	return file_message_send_count_proto_rawDescGZIP(), []int{5}
}

func (x *RemainingDailyMessageSendCount) GetDate() *Date {
	if x != nil {
		return x.Date
	}
	return nil
}

func (x *RemainingDailyMessageSendCount) GetCount() int32 {
	if x != nil {
		return x.Count
	}
	return 0
}

var File_message_send_count_proto protoreflect.FileDescriptor

var file_message_send_count_proto_rawDesc = []byte{
	0x0a, 0x18, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x5f, 0x73, 0x65, 0x6e, 0x64, 0x5f, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x0a, 0x64, 0x61, 0x74, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x8a, 0x01, 0x0a, 0x10, 0x4d, 0x65, 0x73, 0x73, 0x61,
	0x67, 0x65, 0x53, 0x65, 0x6e, 0x74, 0x43, 0x6f, 0x75, 0x6e, 0x74, 0x12, 0x48, 0x0a, 0x0f, 0x6d,
	0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x5f, 0x73, 0x75, 0x72, 0x70, 0x6c, 0x75, 0x73, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x1f, 0x2e, 0x4d, 0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x53, 0x75,
	0x72, 0x70, 0x6c, 0x75, 0x73, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x74,
	0x43, 0x6f, 0x75, 0x6e, 0x74, 0x52, 0x0e, 0x6d, 0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x53, 0x75,
	0x72, 0x70, 0x6c, 0x75, 0x73, 0x12, 0x2c, 0x0a, 0x05, 0x64, 0x61, 0x69, 0x6c, 0x79, 0x18, 0x02,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x16, 0x2e, 0x44, 0x61, 0x69, 0x6c, 0x79, 0x4d, 0x65, 0x73, 0x73,
	0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x74, 0x43, 0x6f, 0x75, 0x6e, 0x74, 0x52, 0x05, 0x64, 0x61,
	0x69, 0x6c, 0x79, 0x22, 0x61, 0x0a, 0x1e, 0x4d, 0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x53, 0x75,
	0x72, 0x70, 0x6c, 0x75, 0x73, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x74,
	0x43, 0x6f, 0x75, 0x6e, 0x74, 0x12, 0x29, 0x0a, 0x0a, 0x79, 0x65, 0x61, 0x72, 0x5f, 0x6d, 0x6f,
	0x6e, 0x74, 0x68, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0a, 0x2e, 0x59, 0x65, 0x61, 0x72,
	0x4d, 0x6f, 0x6e, 0x74, 0x68, 0x52, 0x09, 0x79, 0x65, 0x61, 0x72, 0x4d, 0x6f, 0x6e, 0x74, 0x68,
	0x12, 0x14, 0x0a, 0x05, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52,
	0x05, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x22, 0x48, 0x0a, 0x15, 0x44, 0x61, 0x69, 0x6c, 0x79, 0x4d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x74, 0x43, 0x6f, 0x75, 0x6e, 0x74, 0x12,
	0x19, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x05, 0x2e,
	0x44, 0x61, 0x74, 0x65, 0x52, 0x04, 0x64, 0x61, 0x74, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x63, 0x6f,
	0x75, 0x6e, 0x74, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52, 0x05, 0x63, 0x6f, 0x75, 0x6e, 0x74,
	0x22, 0xa5, 0x01, 0x0a, 0x19, 0x52, 0x65, 0x6d, 0x61, 0x69, 0x6e, 0x69, 0x6e, 0x67, 0x4d, 0x65,
	0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x75, 0x6e, 0x74, 0x12, 0x51,
	0x0a, 0x0f, 0x6d, 0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x5f, 0x73, 0x75, 0x72, 0x70, 0x6c, 0x75,
	0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x28, 0x2e, 0x52, 0x65, 0x6d, 0x61, 0x69, 0x6e,
	0x69, 0x6e, 0x67, 0x4d, 0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x53, 0x75, 0x72, 0x70, 0x6c, 0x75,
	0x73, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x75, 0x6e,
	0x74, 0x52, 0x0e, 0x6d, 0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x53, 0x75, 0x72, 0x70, 0x6c, 0x75,
	0x73, 0x12, 0x35, 0x0a, 0x05, 0x64, 0x61, 0x69, 0x6c, 0x79, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0b,
	0x32, 0x1f, 0x2e, 0x52, 0x65, 0x6d, 0x61, 0x69, 0x6e, 0x69, 0x6e, 0x67, 0x44, 0x61, 0x69, 0x6c,
	0x79, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x75, 0x6e,
	0x74, 0x52, 0x05, 0x64, 0x61, 0x69, 0x6c, 0x79, 0x22, 0x6a, 0x0a, 0x27, 0x52, 0x65, 0x6d, 0x61,
	0x69, 0x6e, 0x69, 0x6e, 0x67, 0x4d, 0x6f, 0x6e, 0x74, 0x68, 0x6c, 0x79, 0x53, 0x75, 0x72, 0x70,
	0x6c, 0x75, 0x73, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f,
	0x75, 0x6e, 0x74, 0x12, 0x29, 0x0a, 0x0a, 0x79, 0x65, 0x61, 0x72, 0x5f, 0x6d, 0x6f, 0x6e, 0x74,
	0x68, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0a, 0x2e, 0x59, 0x65, 0x61, 0x72, 0x4d, 0x6f,
	0x6e, 0x74, 0x68, 0x52, 0x09, 0x79, 0x65, 0x61, 0x72, 0x4d, 0x6f, 0x6e, 0x74, 0x68, 0x12, 0x14,
	0x0a, 0x05, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52, 0x05, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x22, 0x51, 0x0a, 0x1e, 0x52, 0x65, 0x6d, 0x61, 0x69, 0x6e, 0x69, 0x6e,
	0x67, 0x44, 0x61, 0x69, 0x6c, 0x79, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x53, 0x65, 0x6e,
	0x64, 0x43, 0x6f, 0x75, 0x6e, 0x74, 0x12, 0x19, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x65, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x05, 0x2e, 0x44, 0x61, 0x74, 0x65, 0x52, 0x04, 0x64, 0x61, 0x74,
	0x65, 0x12, 0x14, 0x0a, 0x05, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x18, 0x02, 0x20, 0x01, 0x28, 0x05,
	0x52, 0x05, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x42, 0x0b, 0x5a, 0x09, 0x2e, 0x3b, 0x67, 0x72, 0x70,
	0x63, 0x67, 0x65, 0x6e, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_message_send_count_proto_rawDescOnce sync.Once
	file_message_send_count_proto_rawDescData = file_message_send_count_proto_rawDesc
)

func file_message_send_count_proto_rawDescGZIP() []byte {
	file_message_send_count_proto_rawDescOnce.Do(func() {
		file_message_send_count_proto_rawDescData = protoimpl.X.CompressGZIP(file_message_send_count_proto_rawDescData)
	})
	return file_message_send_count_proto_rawDescData
}

var file_message_send_count_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_message_send_count_proto_goTypes = []interface{}{
	(*MessageSentCount)(nil),                        // 0: MessageSentCount
	(*MonthlySurplusMessageSentCount)(nil),          // 1: MonthlySurplusMessageSentCount
	(*DailyMessageSentCount)(nil),                   // 2: DailyMessageSentCount
	(*RemainingMessageSendCount)(nil),               // 3: RemainingMessageSendCount
	(*RemainingMonthlySurplusMessageSendCount)(nil), // 4: RemainingMonthlySurplusMessageSendCount
	(*RemainingDailyMessageSendCount)(nil),          // 5: RemainingDailyMessageSendCount
	(*YearMonth)(nil),                               // 6: YearMonth
	(*Date)(nil),                                    // 7: Date
}
var file_message_send_count_proto_depIdxs = []int32{
	1, // 0: MessageSentCount.monthly_surplus:type_name -> MonthlySurplusMessageSentCount
	2, // 1: MessageSentCount.daily:type_name -> DailyMessageSentCount
	6, // 2: MonthlySurplusMessageSentCount.year_month:type_name -> YearMonth
	7, // 3: DailyMessageSentCount.date:type_name -> Date
	4, // 4: RemainingMessageSendCount.monthly_surplus:type_name -> RemainingMonthlySurplusMessageSendCount
	5, // 5: RemainingMessageSendCount.daily:type_name -> RemainingDailyMessageSendCount
	6, // 6: RemainingMonthlySurplusMessageSendCount.year_month:type_name -> YearMonth
	7, // 7: RemainingDailyMessageSendCount.date:type_name -> Date
	8, // [8:8] is the sub-list for method output_type
	8, // [8:8] is the sub-list for method input_type
	8, // [8:8] is the sub-list for extension type_name
	8, // [8:8] is the sub-list for extension extendee
	0, // [0:8] is the sub-list for field type_name
}

func init() { file_message_send_count_proto_init() }
func file_message_send_count_proto_init() {
	if File_message_send_count_proto != nil {
		return
	}
	file_date_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_message_send_count_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*MessageSentCount); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_message_send_count_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*MonthlySurplusMessageSentCount); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_message_send_count_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DailyMessageSentCount); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_message_send_count_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RemainingMessageSendCount); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_message_send_count_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RemainingMonthlySurplusMessageSendCount); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_message_send_count_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RemainingDailyMessageSendCount); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_message_send_count_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_message_send_count_proto_goTypes,
		DependencyIndexes: file_message_send_count_proto_depIdxs,
		MessageInfos:      file_message_send_count_proto_msgTypes,
	}.Build()
	File_message_send_count_proto = out.File
	file_message_send_count_proto_rawDesc = nil
	file_message_send_count_proto_goTypes = nil
	file_message_send_count_proto_depIdxs = nil
}
